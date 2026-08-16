-- conf/appearance.lua
-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,

        border_size = 2,

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types for info about colors
        col = {
            active_border = {
                colors = { "rgba(70,110,160,1.92)", "rgba(203,219,225,0.82)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",

        -- Custom add
        no_focus_fallback = true,
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
        blur = {
            enabled = true,
            size = 1,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
})
