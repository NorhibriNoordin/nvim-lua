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
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("syntax on")

vim.cmd("set display+=lastline")
vim.cmd("set ruler")

vim.o.swapfile = false

vim.opt.fillchars = { eob = ' ' }
vim.o.swapfile = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.autochdir = false
vim.opt.termguicolors = true
-- vim.o.shell = "powershell.exe"

vim.cmd [[
  autocmd VimEnter * if !argc() | enew | endif
]]

-- tabline
vim.o.showtabline = 2

-- Custom tabline function to show only filenames
function custom_tabline()
    local s = ''
    for i = 1, vim.fn.tabpagenr('$') do
        -- Get the filename of the buffer displayed in the tab
        local buflist = vim.fn.tabpagebuflist(i)
        local winnr = vim.fn.tabpagewinnr(i)
        local bufname = vim.fn.bufname(buflist[winnr])
        local filename = vim.fn.fnamemodify(bufname, ':t') -- Only the file name, no path

        -- Highlight the current tab
        local tab_hl = i == vim.fn.tabpagenr() and '%#TabLineSel#' or '%#TabLine#'

        -- Add filename to the tabline
        s = s .. tab_hl .. ' ' .. filename .. ' '

        -- Add closing tab separator
        s = s .. '%#TabLineFill#'
    end
    return s
end

-- Retain original directory when switching buffers
local original_dir = vim.fn.getcwd()

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("cd " .. original_dir)
    end
})

-- Set the custom tabline
vim.o.tabline = '%!v:lua.custom_tabline()'

-- Flutter
vim.g.flutter_show_log_on_run = "tab"
vim.g["flutter#enable_icon"] = 1
vim.g["flutter#enable_color_preview"] = 1
