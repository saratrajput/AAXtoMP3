FROM ubuntu:20.04

# Update package lists and install software-properties-common
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    jq \
    mediainfo

# Add the PPA for ffmpeg4
RUN add-apt-repository ppa:savoury1/ffmpeg4

# Update the package list after adding the PPA
RUN apt-get update && \
    apt-get install -y ffmpeg

# Any other customizations can go here

CMD ["/bin/bash"]
