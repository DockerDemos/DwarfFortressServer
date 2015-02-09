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

RUN cd /root && git clone $NOVNC

# Download Dwarf Fortress
RUN curl -ssL $DF | tar -xj 
# Disable Sound to prevent errors
RUN sed -i 's/SOUND:YES/SOUND:NO/' /df_linux/data/init/init.txt
# Run in fullscreen
RUN sed -i 's/WINDOWED:YES/WINDOWED:NO/' /df_linux/data/init/init.txt

# Runit config
RUN bash -c "mkdir -p /etc/service/{X11vnc,noVNC,df}"

# xvfb: X Virtual Frame Buffer, display 1, screen 0

# X11vnc: display 1 (redundant, since DISPLAY=:1 is already set)
# -nopw: since we're connecting locally so security isn't an issue
# -listen localhost: self explanitory
# -xkb: fix keymapping problems
# -ncache 10: framebuffer cache (the 10 is redundant; defaults to 10)
# -ncache_cr: tries copyrect opaque window moves instead of wireframes...
#             this is all for looks.  Disabling it will probably improve
#             performance
# -forever: don't exit x11vnc when client disconnects
RUN echo -e "\
#!/bin/bash\n\
\n\
Xvfb : 1 -screen 0 1280x1024x16 &\n\
exec x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever\n\
" >> /etc/service/X11vnc/run

RUN echo -e "\
#!/bin/bash\n\
\n\
cd /root/noVNC\n\
exec ./utils/launch.sh -vnc localhost:5900\n\
" >> /etc/service/noVNC/run

RUN echo -e "\
#!/bin/bash\n\
\n\
cd df_linux\n\
exec df\n\
" >> /etc/service/df/run

RUN chmod -R +x /etc/service

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh

EXPOSE 6080

CMD [ "/usr/bin/runsvdir", "-P", "/etc/service" ]
