FROM python:3-alpine

LABEL maintainer="mma38e"

# Install dependencies
RUN apk add --no-cache \
    ca-certificates \
    ffmpeg \
    openssl \
    aria2 \
    g++ \
    git \
    py3-cffi \
    libffi-dev \
    zlib-dev

RUN pip install --upgrade pip poetry wheel youtube-dl yt-dlp

RUN mkdir -p /music

# Add source code files to WORKDIR
ADD . .

# Create music directory
RUN mkdir -p /music

# Create a volume for the output directory
VOLUME /music

# Change CWD to /music
WORKDIR /music

COPY entrypoint.sh /

# Entrypoint command
CMD ["/entrypoint.sh"]

# Entrypoint command
# ENTRYPOINT ["poetry", "run", "spotdl"]