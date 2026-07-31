local M = {}

local state = false

function M.toggle()
    state = not state

    if state then
        -- GAME MODE ON
        hl.exec_cmd("killall cava")
        hl.exec_cmd("killall waybar")
        hl.config({
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 0,
            },

            animations = {
                enabled = false,
            },

            decoration = {
                shadow = { enabled = false },
                blur = { enabled = false },
                rounding = 0,
            }
        })

    else
        -- GAME MODE OFF

        hl.exec_cmd("waybar &")

        hl.exec_cmd("hyprctl reload")
    end
end

return M
