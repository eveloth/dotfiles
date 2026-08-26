-- Autostart (migrated from startup.conf)
-- exec-once entries now run on the hyprland.start event.

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Portals + polkit
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/portalstart")
    hl.exec_cmd("/usr/libexec/hyprpolkitagent")

    -- Bar + wallpaper
    hl.exec_cmd("eww daemon --restart && eww open bar")
    hl.exec_cmd("swww query || swww-daemon")
    hl.exec_cmd("swww img --no-resize /home/eveloth/Downloads/fire.jpg")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)

-- Historical notes (kept from startup.conf):
-- * pipewire / pipewire-pulse / wireplumber run as openrc user services now
--   (rc-update -U add ... for all three), so no gentoo-pipewire-launcher here.
-- * xdg-desktop-portal + xdg-desktop-portal-wlr also ship openrc user services.
-- * xwayland clipboard sync (wl-paste / clipsync) never worked, left out.
