return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- 'nvim-telescope/telescope-live-grep-args.nvim',
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fG", builtin.git_status, {})
			vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.search_history, {})
			-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {}) -- Recently opened files
			vim.keymap.set("n", "<leader>fC", builtin.commands, {}) -- Available commands
			-- vim.keymap.set('n', '<leader>fr', builtin.registers, {})   -- Registers --TODO: fr assign to flutter run
			-- vim.keymap.set('n', '<leader>ft', builtin.tags, {})        -- Tags -- TODO: ft assign to fluttter log toggle
			vim.keymap.set("n", "<leader>fm", builtin.marks, {}) -- Marks
			-- vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})    -- Quickfix list --TODO: fq assign to flutter qui
			vim.keymap.set("n", "<leader>fl", builtin.loclist, {}) -- Location list
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {}) -- Diagnostics
			-- vim.keymap.set("n", "<leader>fp", builtin.planets, {}) -- Fun: planets picker --FIXME: additional plugin required

			vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, {})

			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							width = 0.90,
							height = 0.8,
							prompt_position = "bottom",
							preview_cutoff = 0, -- always show preview
							preview_height = 0.6, -- preview takes 70% of the height
						},
					},
				},
			})
			-- vim.keymap.set('n', '<leader>fr', ':lua FindAndReplace()<CR>', { noremap = true, silent = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
			-- require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
