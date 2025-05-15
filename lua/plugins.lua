return {
    --
    -- theme
    { 'ryanoasis/vim-devicons' },

    -- misc
    -- {'nvim-telecope/telescope-media-files.nvim'},
    -- {'tpope-vim-fugitive'},
    -- {'jiangmiao/auto-pairs'},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    { 'iamcco/markdown-preview.nvim' },
    { 'mbbill/undotree' },
    -- {'folke/trouble.nvim'},
}
