$(document).ready(function() {
    let currentExamId = null;

    // Load staff and exams on page load
    loadStaff();
    loadPendingExams();

    function loadStaff() {
        // Load radiologists
        $.ajax({
            url: '/api/modalities/radiologists',
            method: 'GET',
            success: function(response) {
                const radiologistsList = $('#radiologistsList');
                const assignRadiologist = $('#assignRadiologist');
                radiologistsList.empty();
                assignRadiologist.find('option:not(:first)').remove();
                
                response.forEach(radiologist => {
                    radiologistsList.append(`
                        <div class="staff-card p-2 border rounded mb-2">
                            <strong>${radiologist.name}</strong>
                            <br>
                            <small>Specialties: ${radiologist.specialties.join(', ')}</small>
                        </div>
                    `);
                    assignRadiologist.append(`<option value="${radiologist.id}">${radiologist.name}</option>`);
                });
            },
            error: function(xhr) {
                alert('Error loading radiologists: ' + xhr.responseText);
            }
        });

        // Load operators
        $.ajax({
            url: '/api/modalities/operators',
            method: 'GET',
            success: function(response) {
                const operatorsList = $('#operatorsList');
                const assignOperator = $('#assignOperator');
                operatorsList.empty();
                assignOperator.find('option:not(:first)').remove();
                
                response.forEach(operator => {
                    operatorsList.append(`
                        <div class="staff-card p-2 border rounded mb-2">
                            <strong>${operator.name}</strong>
                            <br>
                            <small>Equipment: ${operator.equipment.join(', ')}</small>
                        </div>
                    `);
                    assignOperator.append(`<option value="${operator.id}">${operator.name}</option>`);
                });
            },
            error: function(xhr) {
                alert('Error loading operators: ' + xhr.responseText);
            }
        });
    }

    function loadPendingExams() {
        $.ajax({
            url: '/api/exams',
            method: 'GET',
            success: function(response) {
                const pendingExamsTable = $('#pendingExamsTable');
                pendingExamsTable.empty();
                
                response.forEach(exam => {
                    pendingExamsTable.append(`
                        <tr>
                            <td>${exam.patient_name}</td>
                            <td>${exam.modality_name}</td>
                            <td>${new Date(exam.scheduled_date).toLocaleString()}</td>
                            <td>${exam.radiologist_name || 'Not assigned'}</td>
                            <td>${exam.operator_name || 'Not assigned'}</td>
                            <td>
                                <button class="btn btn-primary btn-sm assign-staff" data-exam-id="${exam.id}">
                                    Assign Staff
                                </button>
                            </td>
                        </tr>
                    `);
                });
            },
            error: function(xhr) {
                alert('Error loading pending exams: ' + xhr.responseText);
            }
        });
    }

    // Handle assign staff button click
    $(document).on('click', '.assign-staff', function() {
        currentExamId = $(this).data('exam-id');
        $('#assignmentModal').modal('show');
    });

    // Handle save assignment button click
    $('#saveAssignment').on('click', function() {
        const assignmentData = {
            radiologist_id: $('#assignRadiologist').val(),
            operator_id: $('#assignOperator').val()
        };

        $.ajax({
            url: `/api/exams/${currentExamId}/assign`,
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(assignmentData),
            success: function(response) {
                $('#assignmentModal').modal('hide');
                loadPendingExams();
                alert('Staff assigned successfully!');
            },
            error: function(xhr) {
                alert('Error assigning staff: ' + xhr.responseText);
            }
        });
    });

    // Reset form when modal is closed
    $('#assignmentModal').on('hidden.bs.modal', function() {
        $('#assignmentForm')[0].reset();
        currentExamId = null;
    });
}); 