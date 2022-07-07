xrdb -load ~/.Xresources
xmodmap ~/.Xmodmap
xrandr --output Virtual-0 --mode 2560x1600
exec qtile start
