$(document).ready(function() {
    // Load modalities into select
    $.ajax({
        url: '/api/modalities',
        method: 'GET',
        success: function(response) {
            const modalitySelect = $('#modality');
            response.forEach(modality => {
                modalitySelect.append(`<option value="${modality.id}">${modality.name}</option>`);
            });
        },
        error: function(xhr) {
            alert('Error loading modalities: ' + xhr.responseText);
        }
    });

    // Handle form submission
    $('#examBookingForm').on('submit', function(e) {
        e.preventDefault();

        const examData = {
            patient_name: $('#patientName').val(),
            modality_id: parseInt($('#modality').val()),
            scheduled_date: new Date($('#scheduledDate').val()).toISOString(),
            notes: $('#notes').val()
        };

        $.ajax({
            url: '/api/exams/book',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(examData),
            success: function(response) {
                alert('Exam booked successfully!');
                $('#examBookingForm')[0].reset();
            },
            error: function(xhr) {
                alert('Error booking exam: ' + xhr.responseText);
            }
        });
    });
}); 