return {
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        -- config = true,
        config = function()
            require("flutter-tools").setup({
                -- ui {
                --     dev_log = {
                --         open_in_tab = true
                --     }
                -- }
                -- ui = { -- Use vim.ui.select for code actions
                --     select = function(items, opts)
                --         local choices = {}
                --         for i, item in ipairs(items) do
                --             choices[i] = item.label
                --         end
                --         local choice = vim.ui.select(choices, opts)
                --         if choice then
                --             return items[choice]
                --         end
                --     end,
                --
                --     -- Use telescope for SDK selection if flutter-tools supports customization
                --     sdk_selection = function()
                --         telescope.git_branches({ prompt_title = "Select SDK" })
                --     end,
                --
                --     -- Use telescope for emulator selection if flutter-tools supports customization
                --     emulator_selection = function()
                --         telescope.git_branches({ prompt_title = "Select Emulator" })
                --     end,
                -- },

            })
                vim.keymap.set('n',"gd", vim.lsp.buf.definition, {})
                vim.keymap.set('n',"<leader>aw", vim.lsp.buf.code_action, {})

        end
    },
    {'wa11breaker/flutter-bloc.nvim'}
}
