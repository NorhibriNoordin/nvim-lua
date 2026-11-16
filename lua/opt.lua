-- General Settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 4
vim.opt.number = true
-- vim.opt.relativenumber = true -- Uncomment if desired
vim.opt.showcmd = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.signcolumn = "yes" -- avoid text shifting when gitsigns/diagnostics appear

-- Netrw (replaced by neo-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.ruler = true
vim.opt.display:append("lastline")

-- Built-in undotree (Neovim 0.12+), replaces mbbill/undotree
pcall(vim.cmd.packadd, "nvim.undotree")

-- Extra filetypes
vim.filetype.add({
    extension = {
        axml = "html", -- mini-program markup: HTML-like, gets html/tailwind LSP
        axaml = "xml", -- Avalonia XAML
    },
})
