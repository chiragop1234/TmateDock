# Use a base image with your preferred Linux distribution
FROM ubuntu:latest

# Update the package repository and install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        libevent-dev \
        libncurses5-dev \
        libutempter-dev \
        libssl-dev \
        zlib1g-dev \
        pkg-config \
        git \
        openssh-client \
        openssh-server \
        tmate

# Create a non-root user for running the tmate server
RUN useradd -ms /bin/bash tmateuser

# Switch to the non-root user
USER tmateuser

# Expose the default tmate port
EXPOSE 2222

# Set the entry point to start the tmate server
ENTRYPOINT ["tmate","-F"]
