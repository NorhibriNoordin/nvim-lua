-- config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("opt")
require("keybinds")
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        local args = vim.fn.argv()
        if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
            -- Change directory to the one provided by the argument
            vim.cmd('cd ' .. args[1])
            -- Open Neotree in the left sidebar and focus on the directory
            require('neo-tree.command').execute({ action = 'focus', position = 'left', source = 'filesystem' })
        end
    end
})


-- Automatically open neo-tree when starting nvim with a directory
-- vim.api.nvim_create_autocmd('VimEnter', {
--     pattern = '*',
--     callback = function()
--         local args = vim.fn.argv()
--         if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
--             require('neo-tree.command').execute({ action = 'focus', position = 'left' })
--         end
--     end
-- })

-- Automatically open Neo-tree in the current working directory
-- vim.cmd([[
--   autocmd VimEnter * if argc() == 1 and isdirectory(argv()[0]) |
--     execute 'Neotree ' .. argv()[0] |
--     wincmd p | enew |
--   endif
-- ]])


-- Optional: Add additional configurations here



-- vim.cmd.colorscheme "papercolor"

