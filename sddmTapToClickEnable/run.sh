#!/bin/bash

if [ $UID -ne 0 ] ; then
    echo "Root Permission Required to write to system file"
    exit
fi

echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"

        Option "Tapping" "on"
        Option "NaturalScrolling" "on"
        Option "MiddleEmulation" "on"
        Option "DisableWhileTyping" "on"
EndSection' > /etc/X11/xorg.conf.d/20-touchpad.conf
