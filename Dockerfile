# Use an official CUDA base image with Ubuntu
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

# Install Python and other system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install required Python packages
RUN pip3 install diffusers \
                invisible_watermark \
                transformers \
                accelerate \
                safetensors

# Set the working directory
WORKDIR /app

# Copy your Python script into the Docker image
COPY . /app

# Command to run the Python script
CMD ["python3", "your_script.py"]
