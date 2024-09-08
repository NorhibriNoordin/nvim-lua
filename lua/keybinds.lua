-- main
vim.cmd("inoremap jk <Esc>")
vim.cmd("inoremap kj <Esc>")
-- vim.g.mapleader = "\"

-- Set leader key
-- vim.g.mapleader = '\\'
-- vim.g.maplocalleader = '\\'  -- Set local leader key to space (optional)

-- tabs
vim.cmd("noremap <leader>w 2gt ")
vim.cmd("noremap <leader>e 3gt ")
vim.cmd("noremap <leader>r 4gt ")
vim.cmd("noremap <leader>t 5gt ")
vim.cmd("noremap <leader>1 6gt ")
vim.cmd("noremap <leader>1 7gt ")
vim.cmd("noremap <leader>1 8gt ")
vim.cmd("noremap <leader>1 9gt ")
vim.cmd("noremap <leader>0 :tablast<cr> ")
vim.cmd("noremap <leader>p :tabprevious<cr> ")
-- vim.cmd("noremap <leader>t :tabnew .<cr> ")
vim.cmd("noremap <leader>or :tabonly<cr> ")
vim.cmd("noremap <leader>tq :tabclose<cr> ")
vim.cmd("noremap <leader>o :only<cr> ")

-- split
vim.cmd("noremap <leader>vs :vsplit .<cr> ")
vim.cmd("noremap <leader>s :split .<cr> ")

-- plugins
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')

vim.keymap.set('n', '<C-u>', ':Undotreetoggle<CR>')
