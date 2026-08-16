-- conf/programs.lua
-- Set programs that you use. Pure data, no hl.* calls -- safe to require
-- from anywhere (conf.keybinding, etc.) without side effects.

return {
    terminal = "kitty",
    fileManager = "dolphin",

    menu = "rofi -show drun -theme ~/.config/rofi/applauncher.rasi",
    program_menu = "rofi -show window -theme ~/.config/rofi/opened-apps.rasi",

    emoji_menu = "rofi -show emoji -modi emoji -theme ~/.config/rofi/emoji.rasi "
        .. "-emoji-format '<span size=\"33000\" rise=\"-10000\" >{emoji}</span>   {name}'",

    calculator = "rofi -show calc -modi calc -theme ~/.config/rofi/calc.rasi "
        .. "-no-persist-history -no-history -lines 0",

    clipboard_menu = "rofi -modi clipboard:~/.config/hypr/scripts/cliphist-rofi.sh "
        .. "-show clipboard -show-icons -theme ~/.config/rofi/clipboard.rasi",

    webBrowser = "firefox",
    webBrowser_WithProfileManager = "firefox --ProfileManager",

    -- youtube music desktop app
    musicPlayer = "chromium",
}
