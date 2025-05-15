return {
    ---PAPERCOLOR
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd('set termguicolors')
            vim.cmd('colorscheme PaperColor')
        end
    },
    ---DRACULA
    { 'Mofiqul/dracula.nvim' },
}
