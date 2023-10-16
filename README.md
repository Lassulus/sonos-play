# sonos-play

use pysonos to just play a http url on a sonos stream

first argument is the ip of the controller
second argument is the http url of the stream, (only mp3 seems to be supported)


usage:
`nix run github:lassulus/sonos-play -- 10.9.2.197 https://radio.lassul.us/radio.mp3`
