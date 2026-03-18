
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
vim.opt.fillchars = { eob = ' ' }
vim.opt.swapfile = false
vim.opt.backup = false

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.ruler = true
vim.opt.display:append("lastline")

-- Flutter
vim.g.flutter_show_log_on_run = "tab"
vim.g["flutter#enable_icon"] = 1
vim.g["flutter#enable_color_preview"] = 1

-- Misc
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("enew")
    end
  end,
})

-- NOTE: Removed aggressive BufEnter autocmd that forced CWD to stay static.
-- If you need it back, uncomment below:
-- local original_dir = vim.fn.getcwd()
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "*",
--     callback = function()
--         vim.cmd("cd " .. original_dir)
--     end
-- })
