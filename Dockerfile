FROM n8nio/n8n:latest

USER root

ENV PATH="/sbin:/usr/sbin:/bin:/usr/bin:$PATH"

RUN apk add --no-cache python3 py3-pip py3-virtualenv ffmpeg

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN /opt/venv/bin/pip install --no-cache-dir moviepy edge-tts requests pillow

USER node
