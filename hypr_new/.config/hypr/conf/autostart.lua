-- conf/autostart.lua
-- https://wiki.hypr.land/Configuring/Basics/Autostart/
-- `exec-once` becomes: run hl.exec_cmd() inside the "hyprland.start" event.

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("wal -R")

    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh")

    hl.exec_cmd("sh -c 'sleep 1; waybar'")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("rm -rf ~/.cache/cliphist")
end)
