local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local dap = require('dap')

local M = {}

M.pick_dll = function()
    require("telescope.builtin").find_files({
        find_command = { "rg", "--files", "--color", "never", "--binary", "--no-ignore", "-g", "**/bin/Debug/*/*.dll" },
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                dap.run({
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = selection[1],
                })
            end)
            return true
        end,
    })
end

return M
