return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            -- 'nvim-telescope/telescope-live-grep-args.nvim',
        },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            -- vim.keymap.set('n', '<leader>fr', ':lua FindAndReplace()<CR>', { noremap = true, silent = true })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })

            require("telescope").load_extension("ui-select")
            -- require("telescope").load_extension("live_grep_args")
        end
    },
    {
        'nvim-telescope/telescope-media-files.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope.nvim',

        },
        config = function()
            require'telescope'.setup {
                extensions = {
                    media_files = {
                        -- filetypes whitelist
                        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                        filetypes = {"png", "webp", "jpg", "jpeg"},
                        -- find command (defaults to `fd`)
                        find_cmd = "rg"
                    }
                },
            }
        end
    },
    {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { 'nvim-lua/plenary.nvim' },
    }

}
