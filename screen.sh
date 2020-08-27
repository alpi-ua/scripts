#!/bin/sh

#xrandr --newmode  "1920x1080_60.00"  173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode VGA-1 "1920x1080_60.00"

DISPLAYS=$(xrandr --query | grep "\bconnected\b" | awk {'print $1'})

DISPLAY1=$(echo $DISPLAYS | cut -d' ' -f1)
DISPLAY2=$(echo $DISPLAYS | cut -d' ' -f2)

DISPLAYS_CONNECTED=$(echo $DISPLAYS | wc -w)

[[ $DISPLAYS_CONNECTED == 2 ]] && \
        xrandr --output $DISPLAY1 --auto --rotate normal --pos 0x0 --output $DISPLAY2 --mode "2560x1440" --rate 75 --above $DISPLAY1                                    
