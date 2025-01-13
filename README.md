# tychencode

Simple shell script to encode videos from a list using ffmpeg

REQUIRE:

- ffmpeg, trash-cli (or modify script to replace trash with rm)

INSTALL :

- move this script in /usr/local/bin and use "chmod +x"
- optional: create an alias with at now to launch script silently, i.e. alias tychencode='at now <<< tychencode'

USE:

- make a "tychencode.txt" file listing files to encode, i.e. find /path/to/movies -size +4G >tychencode.txt
- launch script

NOTE:

- last part of the script sends a message via discord to notify if script was successful or not using curl-discord-cronjob that you can find at https://github.com/mturley/curl-discord-cronjob
