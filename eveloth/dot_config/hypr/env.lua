-- Environment variables (migrated from env.conf)
-- hl.env does not expand shell vars, so $HOME is resolved via os.getenv.

-- XDG
hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("XDG_CACHE_HOME",  os.getenv("HOME") .. "/.cache")
hl.env("XDG_DATA_HOME",   os.getenv("HOME") .. "/.local/share")
hl.env("XDG_STATE_HOME",  os.getenv("HOME") .. "/.local/state")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")

-- Cursor (one of these will probably work)
hl.env("XCURSOR_SIZE",     "24")
hl.env("XCURSOR_THEME",    "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE",  "24")

-- Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",         "1")           -- autoscale if possible
hl.env("QT_ENABLE_HIGHDPI_SCALING",           "1")           -- Qt 5.14+
hl.env("QT_QPA_PLATFORM",                     "wayland;xcb")  -- wayland, fall back to x11
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")           -- we tile, no CSD
hl.env("QT_QPA_PLATFORMTHEME",                "qt6ct")

-- GTK
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GDK_SCALE",   "2")

-- Clutter
hl.env("CLUTTER_BACKEND", "wayland")

-- Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Games
hl.env("SDL_VIDEODRIVER", "wayland")
