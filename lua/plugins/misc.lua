return {
    --- markdown preview
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    },
    -- calculator
    {
        'jbyuki/quickmath.nvim',
    },
    {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
    -- {
    --     "HakonHarnes/img-clip.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add options here
    --         -- or leave it empty to use the default settings
    --     },
    --     keys = {
    --         -- suggested keymap
    --         { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    --     },
    -- }
}
