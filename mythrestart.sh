#!/bin/bash
# mythrestart.sh
# Automatically restart mythfrontend if it fails.

xset -dpms
xset s off
xset r rate 1000 30
# Loop the call of mythfrontend.
while [ /bin/true ]
do
        killall mythfrontend
        sleep 5 && xset r rate 1000 30
        mythfrontend -v playback >> /home/dhooper/mythfrontend.log
        sleep 2
done
