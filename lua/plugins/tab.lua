return {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lualine/lualine.nvim" },
    config = function()
        require("tabby.tabline").use_preset("tab_only", {
            lualine_theme = "dracula", -- lualine's built-in theme, no colorscheme plugin needed
        })
    end,
}
