return {
	{
		--File manager
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
			{
				's1n7ax/nvim-window-picker',
				version = '2.*',
				config = function()
					require 'window-picker'.setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal', "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					hijack_netrw_behavior = "open_default",
					group_empty_dirs = true, -- Collapses empty nested folders into one line
					follow_current_file = { enabled = true }, -- Keeps the tree in sync with your active file
				},
				window = {
					position = "float",
					popup = {
						size = {
							height = "80%",
							width = "50%",
						},
						position = "50%", -- Center the window
					},
					mapping_options = {
						noremap = true,
						nowait = true,
					},
					mappings = {
						["<space>"] = "none",
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
				default_component_configs = {
					indent = {
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						indent_size = 1, -- Reduced from 2 to save horizontal space
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
