
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

vim.o.swapfile = false

vim.opt.fillchars = { eob = ' ' }
vim.o.swapfile = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[
  autocmd VimEnter * if !argc() | enew | endif
]]

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

--diagnostic dialog 
-- Customize the floating window's appearance and position
-- Function to open the diagnostics float at the top right corner
-- local function open_diagnostics_float()
--   vim.diagnostic.open_float(nil, {
--     scope = "line",
--     border = "rounded",
--     focusable = false,
--     anchor = "NE",
--     relative = "editor",
--     row = 1,
--     col = vim.o.columns - 1,
--     source = "always",
--     prefix = function(diagnostic)
--       local diag_to_prefix = {
--         [vim.diagnostic.severity.ERROR] = " ",
--         [vim.diagnostic.severity.WARN] = " ",
--         [vim.diagnostic.severity.INFO] = " ",
--         [vim.diagnostic.severity.HINT] = " ",
--       }
--       return diag_to_prefix[diagnostic.severity]
--     end,
--   })
-- end
--
-- -- Automatically show diagnostics float on CursorHold
-- vim.api.nvim_create_autocmd("CursorHold", {
--   pattern = "*",
--   callback = open_diagnostics_float,
-- })
--
--
-- vim.o.updatetime = 300  -- Set delay time in milliseconds



-- Set the custom tabline
vim.o.tabline = '%!v:lua.custom_tabline()'

-- Flutter
vim.g.flutter_show_log_on_run = "tab"
vim.g["flutter#enable_icon"] = 1
vim.g["flutter#enable_color_preview"] = 1

