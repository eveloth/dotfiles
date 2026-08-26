-- Look & feel (migrated from decoration.conf + animations.conf)

hl.config({
    decoration = {
        rounding       = 4,
        rounding_power = 10.0,

        active_opacity   = 0.95,
        inactive_opacity = 0.85,

        -- dim_inactive: looks cool but that's not what tiling is for
        dim_inactive = false,

        blur = {
            enabled           = true,
            size              = 1,
            passes            = 6,
            new_optimizations = true,
            ignore_opacity    = true,
            xray              = true,
        },

        shadow = {
            enabled      = true,
            range        = 30,
            render_power = 100,
            color        = 0xff222222, -- was rgb(222222), opaque
        },
    },

    animations = {
        enabled              = true,
        workspace_wraparound = true,
    },
})

-- Bezier curves (was: bezier = name, x1, y1, x2, y2)
hl.curve("myBezier",  { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("overshoot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })

-- Animation tree (was: animation = leaf, 1, speed, curve)
hl.animation({ leaf = "windows",     enabled = true, speed = 5, bezier = "overshoot" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5, bezier = "overshoot" })
hl.animation({ leaf = "border",      enabled = true, speed = 5, bezier = "overshoot" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 5, bezier = "overshoot" })
hl.animation({ leaf = "fade",        enabled = true, speed = 5, bezier = "overshoot" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5, bezier = "default" })
