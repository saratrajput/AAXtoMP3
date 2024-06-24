FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install software-properties-common
RUN apt-get update && \
    apt-get install -y \
    jq \
    mediainfo \
    python3-pip \
    software-properties-common

# Add the PPA for ffmpeg4
RUN add-apt-repository ppa:savoury1/ffmpeg4 \
    && apt-get update \
    && apt-get install -y ffmpeg

RUN pip3 install audible-cli

# Copy audible-cli config
COPY .audible /root/.audible

# Any other customizations can go here
CMD ["/bin/bash"]
