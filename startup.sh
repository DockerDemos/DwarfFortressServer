#!/bin/bash
export DISPLAY=:1

# X Virtual Frame Buffer, display 1, screen 0
Xvfb :1 -screen 0 1280x1024x16 &

# X11vnc, display 1 (redundant, since DISPLAY=:1 is already set)
# -bg: background
# -nopw, since we're connecting locally so security isn't an issue
# -listen localhost: self explanitory
# -xkb: fix keymapping problems
# -ncache 10: framebuffer cache (the 10 is redundant; defaults to 10)
# -ncache_cr: tries copyrect opaque window moves instead of wireframes...
#             this is all for looks.  Disabling it will probably improve
#             performance
# -forever: don't exit x11vnc when client disconnects

x11vnc -display :1 -bg -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever

cd /root/noVNC && ./utils/launch.sh --vnc localhost:5900 &

exec df_linux/df 
