--###############
--## MONITORS ###
--###############

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})


--##################
--## MY PROGRAMS ###
--##################

programs = require("programs")


--############################
--## ENVIRONMENT VARIABLES ###
--############################

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "BreezeX-Dark")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")


--####################
--## LOOK AND FEEL ###
--####################

hl.curve("linear", {
    type = "bezier",
    points = {{0, 0}, {1, 1}}
})

hl.curve("md3_standard", {
    type = "bezier",
    points = {{0.2, 0}, {0, 1}}
})

hl.curve("md3_decel", {
    type = "bezier",
    points = {{0.05, 0.7}, {0.1, 1}}
})

hl.curve("md3_accel", {
    type = "bezier",
    points = {{0.3, 0}, {0.8, 0.15}}
})


hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "popin 60%",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "popin 60%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "md3_accel",
    style = "popin 60%",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 4,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
})


--##################
--## INPUT #########
--##################

hl.device({
    name = "epic-mouse-v1",
    sensitivity = 0,
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 4,
    direction = "up",
    scale = 0.5,
    action = "float",

})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "resize",
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "fullscreen",
})

--#################
--## BINDS ########
--#################

require("binds")


--##################
--## WINDOW RULES ##
--##################

hl.window_rule({
    match = {
        class = "^(foot)$",
    },
    opacity = "0.8 0.7",
})


hl.window_rule({
    match = {
        class = "^(codium)$",
    },
    opacity = "0.9 0.75",
})


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

--#################
--## MAIN CONFIG ##
--#################

hl.config({

    general = {
        gaps_in = 6,
        gaps_out = 6,
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)"
                },
                angle = 45
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "scrolling",
    },


    decoration = {

        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,


        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },


        blur = {
            enabled = false,
            size = 10,
            passes = 2,
            new_optimizations = true,
            vibrancy = 0.2,
        },

    },


    animations = {
        enabled = true,
    },


    dwindle = {

        smart_split    = true,
        preserve_split = true,

    },


    scrolling = {

        column_width = 0.70,
        focus_fit_method = 1,
        follow_min_visible = 0.2,

    },


    master = {

        new_status = "master",

    },


    misc = {

        disable_hyprland_logo = true,

    },


    input = {

        kb_layout = "us,ru",
        kb_options = "grp:alt_shift_toggle",

        follow_mouse = 1,

        sensitivity = 0.4,


        touchpad = {

            natural_scroll = true,
            disable_while_typing = false,

        },

    },

})


--#################
--## AUTOSTART ####
--#################

hl.on("hyprland.start", function ()
  hl.exec_cmd("pipewire") 
  hl.exec_cmd("waybar")
  hl.exec_cmd(
      "swaybg -i ~/Pictures/wallpapers/astronaut.jpg -m fill"
  )
  hl.exec_cmd(
      "dconf write /org/gnome/desktop/interface/gtk-theme \"'WhiteSur-Dark-nord'\""
  )
  
  hl.exec_cmd(
      "dconf write /org/gnome/desktop/interface/color-scheme \"'prefer-dark'\""
  )
  
  hl.exec_cmd(
      "hyprctl setcursor BreezeX-Dark 24"
  )
end)
