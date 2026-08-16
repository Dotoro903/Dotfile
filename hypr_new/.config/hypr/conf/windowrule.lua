-- conf/windowrule.lua
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- windowrule = float,class:^(kitty)$,title:^(kitty)$

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "float-imv",
    match = { class = "imv" },
    float = true,
})

-- hl.window_rule({ name = "center-imv", match = { class = "imv" }, center = true })

-- Fix some dragging issues with XWayland
-- hl.window_rule({ name = "kitty-opacity", match = { class = "kitty" }, opacity = "0.8 0.8" })
