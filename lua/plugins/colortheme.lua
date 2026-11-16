return {
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark" -- must be set before loading the scheme
            vim.g.PaperColor_Theme_Options = {
                theme = {
                    default = {
                        transparent_background = 0,
                        allow_bold = 1,
                        allow_italic = 0,
                    },
                },
            }
            vim.cmd.colorscheme("PaperColor")
        end,
    },
}
