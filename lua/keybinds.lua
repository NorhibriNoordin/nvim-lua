-- main
vim.cmd("inoremap jk <Esc>")
vim.cmd("inoremap kj <Esc>")
-- vim.g.mapleader = "\"

-- Set leader key
-- vim.g.mapleader = '\\'
-- vim.g.maplocalleader = '\\'  -- Set local leader key to space (optional)

-- tabs
vim.cmd("noremap <leader>1 1gt ")
vim.cmd("noremap <leader>2 2gt ")
vim.cmd("noremap <leader>3 3gt ")
vim.cmd("noremap <leader>4 4gt ")
vim.cmd("noremap <leader>5 5gt ")
vim.cmd("noremap <leader>6 6gt ")
vim.cmd("noremap <leader>7 7gt ")
vim.cmd("noremap <leader>8 8gt ")
vim.cmd("noremap <leader>9 9gt ")
vim.cmd("noremap <leader>q 1gt ")
vim.cmd("noremap <leader>w 2gt ")
vim.cmd("noremap <leader>e 3gt ")
vim.cmd("noremap <leader>r 4gt ")
vim.cmd("noremap <leader>t 5gt ")
vim.cmd("noremap <leader>y 6gt ")
vim.cmd("noremap <leader>u 7gt ")
vim.cmd("noremap <leader>i 8gt ")
vim.cmd("noremap <leader>o 9gt ")
vim.cmd("noremap <leader>0 :tablast<cr> ")
vim.cmd("noremap <leader>p :tabprevious<cr> ")
-- vim.cmd("noremap <leader>t :tabnew .<cr> ")
vim.cmd("noremap <leader>or :tabonly<cr> ")
vim.cmd("noremap <leader>tq :tabclose<cr> ")
vim.cmd("noremap <leader>o :only<cr> ")

--scroll
vim.cmd("noremap <leader>ss :scrollbind<cr>")
vim.cmd("noremap <leader>sq :noscrollbind<cr>")

-- split
vim.cmd("noremap <leader>vs :vsplit .<cr> ")
vim.cmd("noremap <leader>s :split .<cr> ")

-- plugins
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')

vim.keymap.set('n', '<C-u>', ':Undotreetoggle<CR>')

--flutter
vim.keymap.set('n', '<leader>ft', 'FlutterTab<CR>')
vim.keymap.set('n', '<leader>fr', ':FlutterRun<CR>')
vim.keymap.set('n', '<leader>fq', ':FlutterQuit<CR>')
vim.keymap.set('n', '<leader>fu', ':FlutterRun -d RMX3231<CR>')
vim.keymap.set('n', '<leader>fR', ':FlutterHotRestart<CR>')
vim.keymap.set('n','<leader>fo', ':FlutterOutlineToggle<CR>')

-- vim.keymap.set('n', '<leader>fr', ':')
