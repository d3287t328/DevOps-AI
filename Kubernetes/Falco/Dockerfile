# This should be considered the obsolete way to install packages and is for
# illustration purposes only.
# Using cgr.dev/chainguard/python as a parent image
FROM cgr.dev/chainguard/wolfi-base:latest
 
# Setting environment variables
ENV FALCO_VERSION=0.36.0-92+b2ad928
ENV VERSION_BUCKET=bin-dev
 
# Set the working directory in the container to /
WORKDIR /
 
# Step 1: Install essential packages
RUN apk update && \
    apk add --no-cache curl jq
 
# Step 2: Download Falco
RUN curl -L https://download.falco.org/packages/bin-dev/x86_64/falco-0.36.0-92%2Bb2ad928-static-x86_64.tar.gz | tar xz
 
# Step 3: Move Falco
RUN mv falco-0.36.0-92+b2ad928-x86_64 falco
 
# Step 4: Remove unnecessary Falco components
RUN rm -rf /falco/usr/src/falco-* /falco/usr/bin/falco-driver-loader
 
# Remaining steps for your Dockerfile
# ...
