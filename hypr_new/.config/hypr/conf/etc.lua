-- conf/etc.lua

-- exec = gsettings set org.gnome.desktop.interface gtk-theme "YOUR_DARK_GTK4_THEME"  -- for GTK3 apps
-- `exec = ...` (no "-once") re-runs on every config reload. A plain top-level
-- hl.exec_cmd() call here reproduces that, since this file is re-evaluated
-- on reload too.
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'") -- for GTK4 apps

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- for Qt apps

-- NOTE: your old etc.conf had a bare `QT_QPA_PLATFORM = wayland` line with no
-- `env =` prefix, which is not valid hyprlang syntax -- it would have been
-- silently ignored rather than actually setting the variable. Assuming that
-- was meant to be an env var too, here's the corrected version:
hl.env("QT_QPA_PLATFORM", "wayland")
