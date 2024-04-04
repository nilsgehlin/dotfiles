---@param on_attach fun(client, buffer)
local function my_on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end
return {

	-----------------------------------------------------------------------------
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		build = ':Copilot auth',
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},

	-----------------------------------------------------------------------------
	{
		'nvim-cmp',
		dependencies = {
			{
				'zbirenbaum/copilot-cmp',
				dependencies = 'zbirenbaum/copilot.lua',
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require('copilot_cmp')
					copilot_cmp.setup(opts)
					-- attach cmp source whenever copilot attaches
					-- fixes lazy-loading issues with the copilot cmp source
					---@param client vim.lsp.Client
					my_on_attach(function(client)
						if client.name == 'copilot' then
							copilot_cmp._on_insert_enter({})
						end
					end)
				end,
			},
		},
	},
}
