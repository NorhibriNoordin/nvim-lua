
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth")
vim.cmd("set number")
-- vim.cmd("st nu rnu")
vim.cmd("set nobackup")
vim.cmd("set showcmd")
vim.cmd("set nowrap")
vim.cmd("set mouse=a")
vim.cmd("set ts=4 sw=4")
vim.cmd("set scrolloff=4")
vim.cmd("set cursorline")
vim.cmd("set splitbelow")
vim.cmd("set splitright")
-- vim.cmd("set encoding=UTF=8")
vim.cmd("syntax on")

vim.opt.fillchars = { eob = ' ' }
vim.o.swapfile = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[
  autocmd VimEnter * if !argc() | enew | endif
]]

-- vim.set()
-- vim.cmd("set ")
-- vim.cmd("set ")
-- vim.cmd("set ")
--
--
