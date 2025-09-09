return {
	{
		--File manager
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					hijack_netrw_behavior = "open_default",
				},
				-- "open_current",
				-- "disabled",
				window = {
					position = "float",
					popup = {
						size = {
							height = "80%", -- Adjust the height as needed
							width = "50%", -- Adjust the width as needed
						},
						position = { row = "50%", col = "50%" }, -- Center the window
					},
				},
				sources = {
					"filesystem",
					"buffers",
					"git_status",
					"document_symbols",
				},
				enable_git_status = true,
				enable_diagnostics = true,
				popup_border_style = "rounded",
				default_component_configs = {
					indent = {
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						indent_size = 2,
					},
					git_status = {
						symbols = {
							-- Change type
							added = "✚",
							deleted = "✖",
							modified = "",
							renamed = "󰁕",
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "󰄱",
							staged = "",
							conflict = "",
						},
					},
				},
			})
		end,
	},
}
