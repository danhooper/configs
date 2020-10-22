#!/bin/bash
# mythrestart.sh
# Automatically restart mythfrontend if it fails.
ir-keytable -D 5000 -P 5000
xset -dpms
xset s off
xset s noblank
xset r rate 700 255
# Loop the call of mythfrontend.
while [ /bin/true ]
do
        killall mythfrontend
        sleep 5 && xset r rate 700 255
	ir-keytable -D 5000 -P 5000
	xset -dpms
	xset s off
	xset s noblank
        # mythfrontend -v playback >> /home/dhooper/mythfrontend.log
        mythfrontend >> /home/dhooper/mythfrontend.log
        sleep 2
done
