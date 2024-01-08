return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "work",
                path = "~/projects/work/notes",
            },
            {
                name = "personal",
                path = "~/projects/personal/notes",
            },
        },

        disable_frontmatter = true,

        note_id_func = function(title)
            return title
        end,
    },
    keys = {
        { "<leader>ot", ":ObsidianToday<CR>" },
        { "<leader>os", ":ObsidianSearch<CR>" },
        { "<leader>of", ":ObsidianFollow<CR>" },
        { "<leader>ob", ":ObsidianBacklinks<CR>" },
        {
            "<leader>or",
            function()
                local newName = vim.fn.input('New note name: ')
                vim.cmd("ObsidianRename " .. newName)
            end
        },
        {
            "<leader>on",
            function()
                local name = vim.fn.input('Note name: ')
                local cmd = "ObsidianNew " .. name
                vim.cmd(cmd)
            end
        },
    }
}
