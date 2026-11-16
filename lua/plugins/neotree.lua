return {
	{
		--File manager
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		init = function()
			-- Lazy-loaded, so load it up front when started as `nvim <dir>` to keep netrw hijacking.
			local arg = vim.fn.argc(-1) == 1 and vim.fn.argv(0) or nil
			local stat = arg and vim.uv.fs_stat(arg)
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				opts = {
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = {
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							buftype = { "terminal", "quickfix" },
						},
					},
				},
			},
		},
		opts = {
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
					indent_size = 1,
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						deleted = "✖",
						modified = "",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
		},
	},
}
