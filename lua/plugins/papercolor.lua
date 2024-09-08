return {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    -- name="papercolor",
    priority = 1000,
    config = function()
        vim.cmd('set termguicolors')
        vim.cmd('colorscheme PaperColor')
        -- vim.cmd('colorscheme PaperColor')
        -- vim.cmd[[colorscheme PaperColor]]
        -- vim.cmd.colorscheme "PaperColor"
    end
    
}
