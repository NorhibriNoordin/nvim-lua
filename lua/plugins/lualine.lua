-- ~/.config/nvim/lua/plugins.lua

return {
    -- Other plugins...
    
    -- Add lualine.nvim plugin
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'dracula',  -- Change this to your preferred theme
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = { 'NvimTree', 'packer' },
                    always_divide_middle = true,
                    -- globalstatus = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            'filename',
                            path = 1,  -- Show relative path
                            symbols = {
                                modified = '[+]',      -- Text to show when the file is modified.
                                readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            },
                            fmt = function(str)
                                return vim.fn.expand('%:p:h') .. '/' .. vim.fn.expand('%:t')
                            end,
                        },
                    },
                    -- lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = {
                    'neo-tree',  -- Use the built-in Neotree extension for separate lualine
                    {
                        sections = {
                            lualine_a = {'mode'},
                            lualine_b = {'branch'},
                            lualine_c = {
                                {
                                    'filename',
                                    path = 1,
                                    symbols = {
                                        modified = '[+]',
                                        readonly = '[-]',
                                        unnamed = '[No Name]',
                                    },
                                },
                            },
                        },
                        filetypes = {'neo-tree'}  -- Apply this custom config only to Neotree
                    }
                },
                -- extensions = {},
                integrations = {
                    lualine = false,
                },
            }
        end,
    },
}

