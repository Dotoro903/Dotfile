-- conf/keybinding.lua
-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local programs = require("conf.programs")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-------------------------
---- PROGRAM SHORTCUTS ---
-------------------------

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))

-- ROFIS
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(programs.program_menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.clipboard_menu))
hl.bind(mainMod .. " + semicolon", hl.dsp.exec_cmd(programs.emoji_menu))
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd(programs.calculator))

hl.bind(mainMod .. " + y", hl.dsp.exec_cmd("~/.config/hypr/scripts/open-clipboard-image.sh"))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(programs.webBrowser))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(programs.webBrowser_WithProfileManager))

-------------------
---- BASICS ----
-------------------

hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + ALT + CTRL + Q", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Toggle animations
-- Old version shelled out to `hyprctl -j getoption` + jq; native Lua does
-- this in one line with no subprocess.
hl.bind(mainMod .. " + SHIFT + A", function()
    local enabled = hl.get_config("animations.enabled")
    hl.config({ animations = { enabled = not enabled } })
end)

-- Toggle fcitx5
hl.bind(mainMod .. " + ALT + backspace",
    hl.dsp.exec_cmd("bash -c 'if pgrep -x fcitx5; then pkill fcitx5; else fcitx5; fi'"))

-- Alt tab
-- Old config bound Alt+Tab twice (focusurgentorlast, then bringactivetotop);
-- Hyprland used to fire same-key binds in sequence. In Lua a single bind
-- with both dispatches replaces that.
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.focus({ urgent_or_last = true }))
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Screenshot
hl.bind(mainMod .. " + Equal", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + Equal", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + CTRL + Equal", hl.dsp.exec_cmd("hyprshot -m output"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move focus to floating window
-- Old version shelled out to `hyprctl activewindow -j | jq '.floating'`;
-- native Lua reads window state directly, no subprocess, no jq dependency.
hl.bind(mainMod .. " + i", function()
    local w = hl.get_active_window()
    if w ~= nil and w.floating then
        hl.dispatch(hl.dsp.window.cycle_next({ tiled = true }))
    else
        hl.dispatch(hl.dsp.window.cycle_next({ floating = true }))
    end
end)

-- bind = $mainMod, Left, movefocus, l
-- bind = $mainMod, Right, movefocus, r
-- bind = $mainMod, Up, movefocus, u
-- bind = $mainMod, Down, movefocus, d

-- If a tiled window is focused, move the split.
-- If a floating window is focused, move it by pixel offset instead.
-- Old version shelled out to jq for every keypress; this version reads
-- w.floating directly and dispatches the right action.
local function moveOrShift(dx, dy, direction)
    return function()
        local w = hl.get_active_window()
        if w ~= nil and w.floating then
            hl.dispatch(hl.dsp.window.move({ x = dx, y = dy, relative = true }))
        else
            hl.dispatch(hl.dsp.window.move({ direction = direction }))
        end
    end
end

hl.bind(mainMod .. " + SHIFT + H", moveOrShift(-100, 0, "left"))   -- H (<-)
hl.bind(mainMod .. " + SHIFT + J", moveOrShift(0, 100, "down"))    -- J (v)
hl.bind(mainMod .. " + SHIFT + K", moveOrShift(0, -100, "up"))     -- K (^)
hl.bind(mainMod .. " + SHIFT + L", moveOrShift(100, 0, "right"))   -- L (->)

-- Resizing windows
local resize_unit = 100
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -resize_unit, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = resize_unit, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -resize_unit, relative = true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = resize_unit, relative = true }))

-- Toggle monitor focus (only for 2 monitors)
hl.bind(mainMod .. " + backslash", hl.dsp.focus({ monitor = "+1" }))

hl.bind(mainMod .. " + minus", hl.dsp.exec_cmd("~/.config/hypr/scripts/swap_ws_content.sh"))

-- Move active window to the other monitor (only for 2 monitors), and follow it.
-- Old version shelled out to hyprctl + jq three times; native Lua just
-- walks hl.get_monitors().
hl.bind(mainMod .. " + SHIFT + backslash", function()
    local cur = hl.get_active_monitor()
    for _, m in ipairs(hl.get_monitors()) do
        if m.name ~= cur.name then
            hl.dispatch(hl.dsp.window.move({ monitor = m.name }))
            hl.dispatch(hl.dsp.focus({ monitor = m.name }))
            break
        end
    end
end)

----------------
---- WORKSPACES ----
----------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i), follow = true }))
end

-- mainMod + ALT + [0-9] -> workspaces 11-20
-- mainMod + ALT + SHIFT + [0-9] -> move window to workspaces 11-20
for i = 1, 10 do
    local key = i % 10
    local ws = tostring(i + 10)
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.focus({ workspace = ws }))
    hl.bind(mainMod .. " + ALT + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws, follow = true }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + left", hl.dsp.workspace.toggle_special("a"))
hl.bind(mainMod .. " + down", hl.dsp.workspace.toggle_special("b"))
hl.bind(mainMod .. " + up", hl.dsp.workspace.toggle_special("c"))
hl.bind(mainMod .. " + right", hl.dsp.workspace.toggle_special("d"))

-- Close special workspace (double-toggle __TEMP, like the old two-line bind)
hl.bind(mainMod .. " + Home", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("__TEMP"))
    hl.dispatch(hl.dsp.workspace.toggle_special("__TEMP"))
end)

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ workspace = "special:a" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ workspace = "special:b" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ workspace = "special:c" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ workspace = "special:d" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mainMod .. " + SHIFT + period", hl.dsp.window.move({ workspace = "+1", follow = true }))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.window.move({ workspace = "-1", follow = true }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------
---- MEDIA KEYS ----
--------------------

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- --------PlayerCtl--------
-- Spotify: tap = play/pause, long-press = next
-- (old `bindo` == long-press bind, mapped to the `long_press` option)
hl.bind(mainMod .. " + m",
    hl.dsp.exec_cmd("playerctl play-pause --player=" .. programs.musicPlayer .. ",mpv,%any play-pause"))
hl.bind(mainMod .. " + m",
    hl.dsp.exec_cmd("playerctl next --player=" .. programs.musicPlayer .. ",mpv,%any play-pause"),
    { long_press = true })

-- Firefox
hl.bind(mainMod .. " + SHIFT + m",
    hl.dsp.exec_cmd("playerctl play-pause --player=firefox,mpv,%any play-pause"))
