return {
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        priority = 1100,
        -- lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        -- config = true,
        config = function()
            require("flutter-tools").setup({
                ui = {
                    border = "rounded",
                    dev_log = {
                        open_in_tab = true
                    },
                    notification = 'native'
                    --'plugin'
                },
                decorations = {
                    statusline = {
                        app_version = true,
                        device = true,
                        -- project_config = false,
                    }
                },
                debugger = {
                    enabled = false,
                },
                lsp = {
                    color = {
                        enabled = true,
                    }
                },
                widget_guides = {
                    enabled = false,
                },
                settings = {
                    showTodos = false,
                },

                -- on_run = function()
                --     vim.cmd("tabnew")
                --     vim.cmd("terminal flutter run")
                -- end
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
            vim.keymap.set('n',"<leader>f1", function()
                vim.cmd('tabnew')
                vim.cmd('terminal flutter run')
            end
            )
            vim.keymap.set('n',"gd", vim.lsp.buf.definition, {})
            vim.keymap.set('n',"<leader>aw", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

        end
    },
    -- {'natebosch/vim-lsc'},
    -- {'natebosch/vim-lsc-dart'},
    {'Neevash/awesome-flutter-snippets'},
    {'thosakwe/vim-flutter'},
    {'dart-lang/dart-vim-plugin'},
    {'wa11breaker/flutter-bloc.nvim'}
}
