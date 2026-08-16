-- conf/input.lua
-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,

        sensitivity = 0.6, -- -1.0 - 1.0, 0 means no modification.

        accel_profile = "flat",

        touchpad = {
            natural_scroll = false,
        },
    },

    cursor = {
        inactive_timeout = 1,
    },
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
