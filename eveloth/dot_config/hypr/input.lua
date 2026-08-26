-- Input (migrated from input.conf)

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_options = "grp:alt_shift_toggle",

        repeat_rate  = 50,
        repeat_delay = 500,

        accel_profile = "flat",

        -- Decouple mouse-cursor focus from keyboard focus
        follow_mouse = 3,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },
})
