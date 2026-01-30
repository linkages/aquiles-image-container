FROM docker.io/nvidia/cuda:12.8.0-devel-ubuntu24.04

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
        build-essential \
        libstdc++6 \
        python3 \
        python3-pip \
        libavdevice-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip3 install uv --break-system-packages

RUN uv pip install --system --no-cache-dir --break-system-packages torch numpy packaging torchvision ninja psutil

RUN ninja --version

RUN uv pip install --system --no-cache-dir --break-system-packages --no-build-isolation flash-attn

RUN uv pip install --system --no-cache-dir --break-system-packages transformers==4.57.3 ftfy kernels sentencepiece

RUN uv pip install --system --no-cache-dir --break-system-packages git+https://github.com/huggingface/diffusers.git
RUN uv pip install --system --no-cache-dir --break-system-packages git+https://github.com/Lightricks/LTX-2.git#subdirectory=packages/ltx-core
RUN uv pip install --system --no-cache-dir --break-system-packages git+https://github.com/Lightricks/LTX-2.git#subdirectory=packages/ltx-pipelines

RUN uv pip install --system --no-cache-dir git+https://github.com/Aquiles-ai/Aquiles-Image.git
