return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        { "stevearc/dressing.nvim", opts = {} },
        {
            "MeanderingBear/render-markdown.nvim",
            ft = { "markdown", "codecompanion" },
            config = function()
                require("render-markdown").setup({
                    code = {
                        -- Use a custom highlight group for code blocks
                        hl = "CodeCompanionCodeBlock",
                        -- Optionally, add a border or padding
                        border = "rounded",
                        padding = { 1, 6 },
                    },
                })
                -- Define the custom highlight group for code blocks
                vim.cmd('highlight CodeCompanionCodeBlock guifg=#C3E88D guibg=#232634 gui=bold')
            end,
        },
    },
    config = function()
        require('codecompanion').setup({
            copilot = true,
            render_markdown = true,
            highlights = {
                query = "CodeCompanionQuery",
                response = "CodeCompanionResponse",
                system = "CodeCompanionSystem",
                error = "CodeCompanionError",
            },
            icons = {
                user = " ",
                ai = " ",
                system = " ",
            },
        })
        vim.cmd('highlight CodeCompanionQuery guifg=#FFD700 guibg=#1E2746 gui=bold,underline')
        vim.cmd('highlight CodeCompanionResponse guifg=#00FFAF guibg=#1B3322 gui=italic')
        vim.cmd('highlight CodeCompanionSystem guifg=#AAAAAA guibg=#333333')
        vim.cmd('highlight CodeCompanionError guifg=#FF0000 guibg=#222222 gui=bold')
    end
}
