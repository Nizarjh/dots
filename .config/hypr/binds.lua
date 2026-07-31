local programs = require("programs")
local mainMod = "SUPER"
local game_mode = require("game_mode")
-- =========================
-- Apps
-- =========================

hl.bind(mainMod .. " + Return",
    hl.dsp.exec_cmd(programs.terminal)
)

hl.bind(mainMod .. " + E",
    hl.dsp.exec_cmd(programs.fileManager)
)

hl.bind(mainMod .. " + D",
    hl.dsp.exec_cmd(programs.menu)
)

-- =========================
-- Editor profiles
-- =========================

hl.bind(mainMod .. " + SHIFT + J",
    hl.dsp.exec_cmd(programs.editor .. ' --profile "Java"')
)

hl.bind(mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd(programs.editor .. ' --profile "Rust"')
)

hl.bind(mainMod .. " + SHIFT + C",
    hl.dsp.exec_cmd(programs.editor .. ' --profile "C"')
)

-- =========================
-- System controls
-- =========================

hl.bind(mainMod .. " + SHIFT + Q",
    hl.dsp.window.close()
)

hl.bind(mainMod .. " + SHIFT + E",
    hl.dsp.exit()
)

hl.bind(mainMod .. " + CTRL + R",
    hl.dsp.exec_cmd("hyprctl reload")
)

-- =========================
-- Window actions
-- =========================

hl.bind(mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(mainMod .. " + P",
    hl.dsp.window.pseudo()
)

hl.bind(mainMod .. " + F",
    hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })
)

hl.bind(mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)

-- =========================
-- Focus movement
-- =========================

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- =========================
-- Move windows
-- =========================

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "d" }))

-- =========================
-- Resize windows
-- =========================

hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -60, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 60, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0, y = -60, relative = true }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0, y = 60, relative = true }))

-- =========================
-- Workspaces
-- =========================

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({ workspace = i })
    )
end

hl.bind(mainMod .. " + 0",
    hl.dsp.focus({ workspace = 10 })
)

hl.bind(mainMod .. " + SHIFT + 0",
    hl.dsp.window.move({ workspace = 10 })
)

-- =========================
-- Special workspace
-- =========================

hl.bind(mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" })
)

-- =========================
-- Mouse workspace scroll
-- =========================

hl.bind(mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- =========================
-- Mouse actions
-- =========================

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- =========================
-- Media keys
-- =========================

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 10%+"),
    { locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 10%-"),
    { locked = true, repeating = true }
)

-- =========================
-- Media control
-- =========================

hl.bind("XF86AudioNext",     hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause",    hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",     hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",     hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- =========================
-- Screenshots
-- =========================

hl.bind("Print",
    hl.dsp.exec_cmd("grim - | wl-copy --type image/png")
)

hl.bind("SHIFT + Print",
    hl.dsp.exec_cmd("slurp | grim -g - - | wl-copy --type image/png")
)

hl.bind("CTRL + Print",
    hl.dsp.exec_cmd("slurp | grim -g - - | tee ~/Pictures/$(date +%s).png | wl-copy --type image/png")
)

-- =========================
-- Extras
-- =========================

hl.bind(mainMod .. " + SHIFT + G", function()
    game_mode.toggle()
end)

hl.bind(mainMod .. " + SHIFT + B",
    hl.dsp.exec_cmd("wofi-bluetooth")
)

hl.bind("SUPER + L",
    hl.dsp.exec_cmd("hyprctl keyword general:layout dwindle")
)

hl.bind("SUPER + SHIFT + L",
    hl.dsp.exec_cmd("hyprctl keyword general:layout scrolling")
)

hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("~/.config/hypr/monitor_mode.sh")
)

-- Lid switch 
hl.bind("switch:Lid Switch",
    hl.dsp.exec_cmd("hyprlock"),
    { locked = true }
)
