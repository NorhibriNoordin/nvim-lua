-- nvim-treesitter `main` branch (the `master` branch is frozen and unsupported on Neovim 0.12).
-- Needs the `tree-sitter` CLI and a C compiler on PATH to build parsers.
local parsers = {
	"dart",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"javascript",
	"typescript",
	"tsx",
	"json",
	"html",
	"css",
	"scss",
	"yaml",
	"bash",
	"angular",
	"c_sharp",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- the plugin does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if not lang then
					return
				end
				-- Auto-install parsers that exist but aren't installed yet (replaces `auto_install`).
				if not vim.list_contains(ts.get_installed(), lang) then
					if vim.list_contains(ts.get_available(), lang) then
						ts.install(lang)
					end
					return
				end
				if pcall(vim.treesitter.start, args.buf, lang) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
