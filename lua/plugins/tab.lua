return {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    config = function()
        require('tabby.tabline').use_preset('tab_only', {
            -- nerdfont = true, -- if you have a NerdFont installed
            lualine_theme = 'dracula',
        })
    end
}
