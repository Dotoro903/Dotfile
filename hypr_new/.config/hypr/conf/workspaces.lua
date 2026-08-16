-- conf/workspaces.lua
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local monitors = require("conf.monitors")

for i = 1, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = monitors.main_monitor })
end

for i = 11, 20 do
    hl.workspace_rule({ workspace = tostring(i), monitor = monitors.second_monitor })
end
