DwarfFortress "Server"
======================

_v0.1 - 20141219_

Play [Dwarf Fortress](http://www.bay12games.com/dwarves/) in your browser with Docker and NoVNC!

_"You got your Dwarf Fortress in my Docker!  You got your Docker in my Dwarf Fortress!"_

Can you dig it?

### Building and Running ###

Build the Image:

1. `git clone https://github.com/DockerDemos/DwarfFortressServer.git`
2. `sudo docker build -t dwarffortress .`

Run the container:


    sudo docker run -d -p 80:6080 dwarffortress

To Play Dwarf Fortress in your browser (requires HTML5 support), visit http://\<IP ADDRESS OF YOUR HOST\>/, and click "Connect".  No password is required.


_Note:_ Check your browser's HTML5 Websocket support: [http://caniuse.com/#search=web%20sockets](http://caniuse.com/#search=web%20sockets)

### Known Issues ###

* No current mechanism for saving your data when you stop the Docker container
* Unable to reconnect to NoVNC session after disconnecting
* NoVNC config needs some work to improve stability

### Acknowledgments ###

* Thanks to Toady and ThreeToe for making [Dwarf Fortress](http://www.bay12games.com/dwarves/) - best.game.evar!
* Thanks to the [NoVNC team](https://kanaka.github.io/noVNC/).  VNC in a browser is absolutely amazing.
* Thanks to [Paim Pozhil](https://github.com/paimpozhil) for helping me figure out NoVNC with his [Docker-NoVNC repo](https://github.com/paimpozhil/docker-novnc)!

### Copyright Info ###

[Dwarf Fortress](http://www.bay12games.com/dwarves/) is Copyright (C) 2002-2014, Tarn Adams.

[NoVNC team](https://kanaka.github.io/noVNC/) is licensed under the MPL-2.0.

The Dockerfile and related code, scripts or documentation in this repository is:

Copyright (C) 2014 Chris Collins

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

