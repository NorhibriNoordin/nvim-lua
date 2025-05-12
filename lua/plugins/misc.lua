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
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    dart = { "dart_format" },
                },
                format_on_save = {
                    timeout_ms = 1000,
                    lsp_fallback = true,
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    json = { "prettier" },
                    markdown = { "prettier" },
                    yaml = { "prettier" },
                    dart = { "dart_format" },
                }
            })
        end,
    }


    -- TODO format doc like vscode (maybe)
    -- {
    --     'stevearc/conform.nvim',
    --     opts = {}
    -- }
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
