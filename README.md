DwarfFortress "Server"
======================

_Version: 2.0 - 20150209_

Play [Dwarf Fortress](http://www.bay12games.com/dwarves/) in your browser with Docker and NoVNC!

_"You got your Dwarf Fortress in my Docker!  You got your Docker in my Dwarf Fortress!"_

Can you dig it?

### Building and Running ###

The `runme` script will manage both building the image and running the container:

    $ ./runme.sh --help
    Usage: ./runme [OPTIIONS]
    
    Dwarf Fortress in a Docker container
    
    Options:
      --rebuild-image	Rebuild the Docker image before running
      --no-cache	Do not use Docker's image cache when building
      --pull-latest	Pull the latest code from the Github; implies --rebuild-image
      --no-persist	Don't mount a volume to save DwarfFortress data into
      --help		Print this message
      --version		Print the version info and exit

To Play Dwarf Fortress in your browser (requires HTML5 support), visit http://\<ip address or hostname of your host\>/, and click "Connect".  No password is required.


_Note:_ Check your browser's HTML5 Websocket support: [http://caniuse.com/#search=web%20sockets](http://caniuse.com/#search=web%20sockets)

### Known Issues ###

Tracked on Github: [https://github.com/DockerDemos/DwarfFortressServer/issues](https://github.com/DockerDemos/DwarfFortressServer/issues)

### Acknowledgments ###

* Thanks to Toady and ThreeToe for making [Dwarf Fortress](http://www.bay12games.com/dwarves/) - best.game.evar!
* Thanks to the [NoVNC team](https://kanaka.github.io/noVNC/).  VNC in a browser is absolutely amazing.
* Thanks to [Paim Pozhil](https://github.com/paimpozhil) for helping me figure out NoVNC with his [Docker-NoVNC repo](https://github.com/paimpozhil/docker-novnc)!

### Copyright Info ###

[Dwarf Fortress](http://www.bay12games.com/dwarves/) is Copyright (C) 2002-2015, Tarn Adams.

[NoVNC team](https://kanaka.github.io/noVNC/) is licensed under the MPL-2.0.

The Dockerfile and related code, scripts or documentation in this repository is:

Copyright (C) 2014-15 Chris Collins

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

