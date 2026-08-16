-- conf/layout.lua

hl.config({
    dwindle = {
        -- pseudotile = true, -- Master switch for pseudotiling, bound to mainMod + P in keybinding.lua
        preserve_split = true, -- You probably want this
        force_split = 2,
        smart_resizing = false,
        smart_split = false,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})
