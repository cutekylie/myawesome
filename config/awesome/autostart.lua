local awful = require("awful")

awful.spawn.with_shell("xrandr --output HDMI-0 --mode 1920x1080 --rate 144")
awful.spawn.with_shell("picom --daemon")
awful.spawn.with_shell("feh --no-fehbg --bg-fill /home/metodico/.config/awesome/wallpaper/wallpaper2.png")
