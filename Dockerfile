FROM ubuntu:14.10
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV PKGS git x11vnc wget python python-numpy unzip Xvfb curl tar bzip2 runit
ENV DFPKGS libgtk2.0-0:i386 libglu1-mesa:i386 libsdl-image1.2:i386 libsdl-sound1.2:i386 libsdl-ttf2.0-0:i386 libopenal1:i386
ENV NOVNC https://github.com/kanaka/noVNC.git
ENV DF http://www.bay12games.com/dwarves/df_40_24_linux.tar.bz2
ENV DISPLAY :1

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y $PKGS $DFPKGS

RUN git clone $NOVNC
WORKDIR /noVNC
RUN ln -s vnc.html index.html
WORKDIR /

# Download Dwarf Fortress
RUN curl -ssL $DF | tar -xj 
# Disable Sound to prevent errors
RUN sed -i 's/SOUND:YES/SOUND:NO/' /df_linux/data/init/init.txt
# Run in fullscreen
RUN sed -i 's/WINDOWED:YES/WINDOWED:NO/' /df_linux/data/init/init.txt

# Runit config
RUN bash -c "mkdir -p /etc/service/{X11vnc,noVNC,df}"
ADD X11vnc.run /etc/service/X11vnc/run
ADD noVNC.run /etc/service/noVNC/run
ADD df.run /etc/service/df/run

RUN chmod -R +x /etc/service

EXPOSE 6080

CMD [ "/usr/bin/runsvdir", "-P", "/etc/service" ]
