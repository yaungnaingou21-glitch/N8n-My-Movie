FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g n8n

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN /opt/venv/bin/pip install --no-cache-dir moviepy edge-tts requests pillow

ENV N8N_PORT=10000
EXPOSE 10000

CMD ["n8n", "start"]
