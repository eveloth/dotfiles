-- Window rules (migrated from windows/*.conf)
-- Rules are evaluated top to bottom.

hl.window_rule({
    -- Ignore maximize requests from apps (kitty opens maximized otherwise)
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "firefox-ws2",
    match = { class = "firefox" },
    workspace = "2 silent",
})

hl.window_rule({
    name  = "share-picker-float",
    match = { class = "hyprland-share-picker" },
    float  = true,
    center = true,
})

hl.window_rule({
    name  = "pavucontrol-float",
    match = { class = "org.pulseaudio.pavucontrol" },
    float  = true,
    center = true,
    -- bugfix #3: `size 38% 57%` -> expression form (Lua size takes numbers/expressions)
    size   = { "monitor_w * 0.38", "monitor_h * 0.57" },
})

hl.window_rule({
    name  = "pip-float",
    match = { title = "^(Picture-in-Picture)$" },
    float  = true,
    center = true,
    -- bugfix #4: dropped invalid `movev 69.5% 4%` rule (contradicted center)
})

hl.window_rule({
    -- bugfix #1: `silend` typo -> silent; match class instead of title regex
    name  = "steam-ws5",
    match = { class = "steam" },
    workspace = "5 silent",
})

hl.window_rule({
    name  = "telegram-ws4",
    match = { class = "org.telegram.desktop" },
    workspace = "4 silent",
})

hl.window_rule({
    name  = "virt-manager-ws3",
    match = { class = "virt-manager" },
    workspace = "3 silent",
    float  = true,
    center = true,
})

hl.window_rule({
    name  = "zen-ws2",
    match = { class = "zen" },
    workspace = "2 silent",
})
