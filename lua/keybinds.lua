-- main
-- vim.cmd("inoremap jk <Esc>")
-- vim.cmd("inoremap kj <Esc>")

vim.keymap.set("i", "kj", "<Esc>", { noremap = true })
-- vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

-- timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 200

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
vim.cmd("noremap <leader>tn :tabnext<cr>")
vim.cmd("noremap <leader>to :tabmove 0<cr>")
vim.cmd("noremap <leader>or :tabonly<cr> ")
vim.cmd("noremap <leader>tq :tabclose<cr> ")
vim.cmd("noremap <leader>tp :tablast<cr> ")
vim.cmd("noremap <leader>o :only<cr> ")

--Split Navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Move to left split
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Move to bottom split
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Move to top split
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Move to right split

-- Split swap
vim.api.nvim_set_keymap("n", "<leader>wh", "<C-w>H", { noremap = true, silent = true }) -- Move current split to the far left
vim.api.nvim_set_keymap("n", "<leader>wl", "<C-w>L", { noremap = true, silent = true }) -- Move current split to the far right
vim.api.nvim_set_keymap("n", "<leader>wj", "<C-w>J", { noremap = true, silent = true }) -- Move current split to the very bottom
vim.api.nvim_set_keymap("n", "<leader>wk", "<C-w>K", { noremap = true, silent = true }) -- Move current split to the top

-- split
vim.cmd("noremap <leader>vs :vsplit .<cr> ")
vim.cmd("noremap <leader>s :split .<cr> ")

-- Buffer Navigation
vim.api.nvim_set_keymap("n", "<leader>b", ":BufferNext<CR>", { noremap = true, silent = true }) -- Move to next buffer
vim.api.nvim_set_keymap("n", "<leader>B", ":BufferPrevious<CR>", { noremap = true, silent = true }) -- Move to previous buffer

--scroll
vim.cmd("noremap <leader>ss :set scrollbind<cr>")
vim.cmd("noremap <leader>sq :set noscrollbind<cr>")

-- plugins
vim.cmd("noremap <C-n> :Neotree toggle<cr> ")
-- vim.cmd("noremap <leader>tb :Neotree buffers<cr> ")
vim.cmd("noremap <leader>tg :Neotree git_status<cr> ")
-- vim.cmd("noremap <C-m> :Neotree buffers<cr> ")
-- vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
-- vim.keymap.set('n', '<C-u>', ':Undotreetoggle<CR>')

--flutter
vim.keymap.set("n", "<leader>ft", ":FlutterLogToggle<CR>")
vim.keymap.set("n", "<leader>fc", ":FlutterLogClear<CR>")
vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>")
vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>")
-- vim.keymap.set('n', '<leader>fu', ':FlutterRun -d RMX3231<CR>')
vim.keymap.set("n", "<leader>fu", ":FlutterRun -d RMX3231<CR> :only<CR>")
vim.keymap.set("n", "<leader>fR", ":FlutterHotRestart<CR>")
vim.keymap.set("n", "<leader>fo", ":FlutterOutlineToggle<CR>")

--trouble
vim.keymap.set("n", "<leader>tt", ":Trouble diagnostics toggle<CR>")

-- codecompanion
vim.keymap.set("n", "<leader>cc", ":CodeCompanionToggle<CR>")
vim.keymap.set("n", "<leader>ca", ":CodeCompanionActions<CR>")
vim.keymap.set("n", "<leader>ch", ":CodeCompanionChat<CR>")
