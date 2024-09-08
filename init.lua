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

require("config")
require("keybinds")
require("lazy").setup("plugins")

-- Automatically open neo-tree when starting nvim with a directory
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        local args = vim.fn.argv()
        if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
            require('neo-tree.command').execute({ action = 'focus', position = 'left' })
        end
    end
})

-- Optional: Add additional configurations here



-- vim.cmd.colorscheme "papercolor"

