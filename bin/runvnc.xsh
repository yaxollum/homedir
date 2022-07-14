try:
    xrandr --output DP-3 --mode 1920x1080 -display ':0.0'
    x11vnc --loop -display ':0'
finally:
    xrandr --output DP-3 --auto
