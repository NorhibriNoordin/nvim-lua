local map = vim.keymap.set

-- Escape
map("i", "kj", "<Esc>")

-- timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 200

-- tabs ("" = normal, visual and operator-pending, like :noremap)
for i = 1, 9 do
    map("", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i })
end
local qwerty_tabs = { "q", "w", "e", "r", "t", "y", "u", "i" } -- <leader>o is :only
for i, key in ipairs(qwerty_tabs) do
    map("", "<leader>" .. key, i .. "gt", { desc = "Go to tab " .. i })
end
map("", "<leader>0", "<cmd>tablast<cr>", { desc = "Last tab" })
map("", "<leader>p", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("", "<leader>to", "<cmd>tabmove 0<cr>", { desc = "Move tab first" })
map("", "<leader>or", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
map("", "<leader>tq", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("", "<leader>tp", "<cmd>tablast<cr>", { desc = "Last tab" })
map("", "<leader>o", "<cmd>only<cr>", { desc = "Close other windows" })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Split swap
map("n", "<leader>wh", "<C-w>H", { desc = "Move split far left" })
map("n", "<leader>wl", "<C-w>L", { desc = "Move split far right" })
map("n", "<leader>wj", "<C-w>J", { desc = "Move split bottom" })
map("n", "<leader>wk", "<C-w>K", { desc = "Move split top" })

-- split
map("", "<leader>vs", "<cmd>vsplit .<cr>", { desc = "Vertical split" })
map("", "<leader>s", "<cmd>split .<cr>", { desc = "Horizontal split" })

-- Buffer navigation
map("n", "<leader>b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>B", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- scroll
map("", "<leader>ss", "<cmd>set scrollbind<cr>", { desc = "Scrollbind on" })
map("", "<leader>sq", "<cmd>set noscrollbind<cr>", { desc = "Scrollbind off" })

-- undotree (built-in)
map("n", "<leader>U", "<cmd>Undotree<cr>", { desc = "Undotree" })

-- neo-tree
map("", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Neo-tree" })
map("", "<leader>tg", "<cmd>Neotree git_status<cr>", { desc = "Neo-tree git status" })

-- flutter
map("n", "<leader>ft", "<cmd>FlutterLogToggle<cr>", { desc = "Flutter log toggle" })
map("n", "<leader>fc", "<cmd>FlutterLogClear<cr>", { desc = "Flutter log clear" })
map("n", "<leader>fr", "<cmd>FlutterRun<cr>", { desc = "Flutter run" })
map("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter quit" })
map("n", "<leader>fu", "<cmd>FlutterRun -d RMX3231<cr><cmd>only<cr>", { desc = "Flutter run on RMX3231" })
map("n", "<leader>fR", "<cmd>FlutterHotRestart<cr>", { desc = "Flutter hot restart" })
map("n", "<leader>fO", "<cmd>FlutterOutlineToggle<cr>", { desc = "Flutter outline" }) -- <leader>fo is oldfiles

-- trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })

-- codecompanion
map("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanion toggle chat" })
map({ "n", "v" }, "<leader>cA", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion actions" }) -- <leader>ca is LSP code action
map("n", "<leader>ch", "<cmd>CodeCompanionChat<cr>", { desc = "CodeCompanion new chat" })
