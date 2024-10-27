return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
  },
  -- config = true
    config = function()
        require('codecompanion').setup({
            copilot = true,
            vim.cmd('highlight CodeCompanionQuery guifg=#FF0000 guibg=#000000'),
            vim.cmd('highlight CodeCompanionResponse guifg=#00ff00 guibg=#000000'),
        })
    end
}
