-- conf/monitors.lua
-- https://wiki.hypr.land/Configuring/Basics/Monitors/

local main_monitor = "DP-4"
local second_monitor = "HDMI-A-2"

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = main_monitor, mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = second_monitor, mode = "preferred", position = "auto", scale = 1 })

-- Exported so conf.workspaces (and anything else) can reuse these names
-- without hardcoding them twice.
return {
    main_monitor = main_monitor,
    second_monitor = second_monitor,
}
