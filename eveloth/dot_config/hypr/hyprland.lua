-- Hyprland config entrypoint (migrated from hyprland.conf).
-- The old *.conf files are kept in this directory for reference only -- once
-- this hyprland.lua exists, Hyprland ignores hyprland.conf entirely.

--------------------------------------------------------------------------------
-- Core config
--------------------------------------------------------------------------------
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 0,
        -- col.active_border alternatives kept from hyprland.conf:
        --   { colors = { "rgba(245,65,39,0.8)", "rgba(245,121,39,0.8)" }, angle = 45 }
        --   "0x595898ff"
        col = {
            active_border   = "rgb(928374)",
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        layout           = "master",
        allow_tearing    = true,

        snap = {
            enabled = true,
        },
    },

    master = {
        mfact = 0.5,
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },

    render = {
        cm_auto_hdr    = 2,
        direct_scanout = 1,
    },

    debug = {
        full_cm_proto = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

--------------------------------------------------------------------------------
-- Monitors
--------------------------------------------------------------------------------
-- DON'T set bitdepth to 10 -- it kills screencast.
hl.monitor({
    output = "DP-3",
    mode   = "3840x2160@144",
    scale  = 2.0,
})

--------------------------------------------------------------------------------
-- Modules (relative to this file: ~/.config/hypr/<name>.lua)
--------------------------------------------------------------------------------
require("env")
require("autostart")
require("input")
require("look-and-feel")
require("binds")
require("rules")
