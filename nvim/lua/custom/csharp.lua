function create_csharp_class()
    vim.ui.input({ prompt = 'Enter class name: ' }, 
        function(input) 
            if input == nil or input == '' then
                return
            end
            
            vim.fn.jobstart({"dotnet", "new", "class", "-n", input}, {
               on_exit = function (job_id, exit_code) 
                    if exit_code == 0 then
                       vim.cmd.edit(input .. ".cs")
                    end
               end
            })
        end)
end
vim.keymap.set("n", "<leader>nc", "<cmd>lua create_csharp_class()<cr>")
-- map('n', '<leader>nc', "<cmd>lua create_csharp_class()<cr>")
