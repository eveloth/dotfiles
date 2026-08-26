-- Keybinds (migrated from binds.conf, workspaces.conf, and the mouse binds
-- that lived in hyprland.conf)

local mod     = "SUPER"
local browser = "zen"

--------------------------------------------------------------------------------
-- Apps / actions
--------------------------------------------------------------------------------
hl.bind(mod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + O", hl.dsp.exec_cmd("obsidian --ozone-platform-hint=auto --enable-features=UseOzonePlatform,WaylandWindowDecorations"))

hl.bind("print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

--------------------------------------------------------------------------------
-- `run` launcher submap (SUPER+R, each entry auto-resets to default)
--------------------------------------------------------------------------------
hl.bind(mod .. " + R", hl.dsp.submap("run"))

hl.define_submap("run", "reset", function()
    hl.bind("T", hl.dsp.exec_cmd("Telegram --ozone-platform-hint=auto --enable-features=UseOzonePlatform,WaylandWindowDecorations"))
    hl.bind("J", hl.dsp.exec_cmd("jetbrains-toolbox"))
    hl.bind("F", hl.dsp.exec_cmd("thunar"))
    hl.bind("D", hl.dsp.exec_cmd("vesktop"))
    hl.bind("S", hl.dsp.exec_cmd("steam"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

--------------------------------------------------------------------------------
-- Window management
--------------------------------------------------------------------------------
hl.bind(mod .. " + J", hl.dsp.window.cycle_next({ next = false })) -- was: cyclenext, prev
hl.bind(mod .. " + K", hl.dsp.window.cycle_next())
hl.bind(mod .. " + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + L", hl.dsp.window.move({ direction = "r" }))

hl.bind(mod .. " + return", hl.dsp.window.fullscreen())

-- SUPER+Tab was two binds on one key (cyclenext + bringactivetotop); Lua needs
-- them combined into one callback.
hl.bind(mod .. " + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

--------------------------------------------------------------------------------
-- Volume
--------------------------------------------------------------------------------
hl.bind(mod .. " + page_up",   hl.dsp.exec_cmd("wpctl set-volume -l 1.1 @DEFAULT_SINK@ 1%+"), { repeating = true })
hl.bind(mod .. " + page_down", hl.dsp.exec_cmd("wpctl set-volume -l 1.1 @DEFAULT_SINK@ 1%-"), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.1 @DEFAULT_SINK@ 1%+"), { repeating = true }) -- was binde
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.1 @DEFAULT_SINK@ 1%-"), { locked = true })    -- was bindl

--------------------------------------------------------------------------------
-- VPN (altair) -- bugfix #2: each of these was declared twice in binds.conf
--------------------------------------------------------------------------------
hl.bind(mod .. " + end",  hl.dsp.exec_cmd("nmcli c u altair"))
hl.bind(mod .. " + home", hl.dsp.exec_cmd("nmcli c d altair"))

--------------------------------------------------------------------------------
-- Mouse (were bare `bindm` lines in hyprland.conf)
--------------------------------------------------------------------------------
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------------------------------------------------------------------
-- Workspaces
-- Custom layout: A S D F G -> 1..5, number row 1..5 -> 6..10
--   SUPER+key          : switch
--   SUPER+SHIFT+key     : move active window there, stay (movetoworkspacesilent)
--   SUPER+CTRL+key      : move active window there, follow (movetoworkspace)
--------------------------------------------------------------------------------
local workspace_keys = {
    { key = "A", ws = 1 },
    { key = "S", ws = 2 },
    { key = "D", ws = 3 },
    { key = "F", ws = 4 },
    { key = "G", ws = 5 },
    { key = "1", ws = 6 },
    { key = "2", ws = 7 },
    { key = "3", ws = 8 },
    { key = "4", ws = 9 },
    { key = "5", ws = 10 },
}

for _, m in ipairs(workspace_keys) do
    hl.bind(mod .. " + " .. m.key,         hl.dsp.focus({ workspace = m.ws }))
    hl.bind(mod .. " + SHIFT + " .. m.key, hl.dsp.window.move({ workspace = m.ws, follow = false }))
    hl.bind(mod .. " + CTRL + " .. m.key,  hl.dsp.window.move({ workspace = m.ws }))
end

-- Scroll through workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
