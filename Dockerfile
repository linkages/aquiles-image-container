FROM nvidia/cuda:12.8.0-devel-ubuntu22.04
#FROM docker.io/nvidia/cuda:13.1.1-devel-ubuntu22.04

RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        build-essential \
        wget \
        libgl1 \
        libglib2.0-0 \
        ffmpeg \
        libavcodec-dev \
        libavformat-dev \
        libavutil-dev \
        libswscale-dev \
        libavfilter-dev \
        python3 \
        python3-pip \
        build-essential \
        libstdc++6 \
        libavdevice-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip3 install uv

#RUN uv pip install --system --no-cache-dir torch==2.8 numpy packaging torchvision ninja
RUN uv pip install --system --no-cache-dir torch numpy packaging torchvision ninja psutil

RUN ninja --version

RUN uv pip install --system --no-cache-dir flash-attn --no-build-isolation

#RUN wget https://github.com/mjun0812/flash-attention-prebuild-wheels/releases/download/v0.3.14/flash_attn-2.8.2+cu128torch2.8-cp312-cp312-linux_x86_64.whl && \
#        uv pip install --system --no-cache-dir flash_attn-2.8.2+cu128torch2.8-cp312-cp312-linux_x86_64.whl

#RUN wget https://github.com/mjun0812/flash-attention-prebuild-wheels/releases/download/v0.3.14/flash_attn-2.8.2+cu128torch2.8-cp310-cp310-linux_x86_64.whl && \
#        uv pip install --system --no-cache-dir flash_attn-2.8.2+cu128torch2.8-cp310-cp310-linux_x86_64.whl

RUN uv pip install --system --no-cache-dir transformers==4.57.3 ftfy kernels sentencepiece
#RUN uv pip install --system --no-cache-dir diffusers
RUN uv pip install --system --no-cache-dir git+https://github.com/huggingface/diffusers.git
RUN uv pip install --system --no-cache-dir git+https://github.com/Lightricks/LTX-2.git#subdirectory=packages/ltx-core
RUN uv pip install --system --no-cache-dir git+https://github.com/Lightricks/LTX-2.git#subdirectory=packages/ltx-pipelines

# Use this if you want to enable flux.2
# RUN uv pip install git+https://github.com/huggingface/diffusers.git

#RUN uv pip install --system --no-cache-dir git+https://github.com/Aquiles-ai/Aquiles-Image.git
RUN uv pip install --system --no-cache-dir aquiles-image
