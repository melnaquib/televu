# FROM jodogne/orthanc-plugins
FROM orthancteam/orthanc:latest

RUN apt-get update
RUN apt-get install -y build-essential \
    python3-full python3-pip \
    python3-requests python3-setuptools python3-dev
RUN apt-get install ffmpeg libsm6 libxext6 -y

WORKDIR /opt/app
COPY requirements.txt /opt/app/
RUN pip3 install -r requirements.txt --break-system-packages
# COPY python/* /opt/app/

# RUN mv /usr/share/orthanc/plugins/libModalityWorklists.so /
# /usr/share/orthanc/plugins/

# RUN cp /usr/share/orthanc/plugins-available/libOsimisWebViewer.so \
# /usr/share/orthanc/plugins-available/libModalityWorklists.so

# RUN cp /usr/share/orthanc/plugins-available/libOsimisWebViewer.so \
# /usr/share/orthanc/plugins/libModalityWorklists.so
