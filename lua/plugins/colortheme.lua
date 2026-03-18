return {
    ---PAPERCOLOR
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        opts = {
            theme = {
                default = {
                    transparent_background = 0,
                    allow_bold = 1,
                    allow_italic = 0,
                },
            },
        },
        config = function()
            vim.cmd('set termguicolors')
            vim.cmd('colorscheme PaperColor')
            vim.o.background = "dark"
        end
    },
    ---DRACULA
    { 'Mofiqul/dracula.nvim' },
}
