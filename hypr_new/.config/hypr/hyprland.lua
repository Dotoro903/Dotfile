-- ~/.config/hypr/hyprland.lua
-- Entry point for Hyprland >= 0.55 (Lua config).
-- Docs: https://wiki.hypr.land/Configuring/Start/
--
-- Load order mirrors the old hyprland.conf `source =` order.
-- conf.monitors and conf.programs return tables that other files
-- `require()` again later -- Lua caches modules, so they only run once.

require("conf.monitors")
require("conf.programs")
require("conf.autostart")
require("conf.environment")
require("conf.permission")
require("conf.appearance")
require("conf.animation")
require("conf.layout")
require("conf.misc")
require("conf.input")
require("conf.keybinding")
require("conf.windowrule")
require("conf.workspaces")
require("conf.etc")
