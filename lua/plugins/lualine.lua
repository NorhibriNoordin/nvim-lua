return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                icons_enabled = true,
                theme = "dracula", -- lualine's built-in theme
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = {
                    {
                        function()
                            local clients = vim.lsp.get_clients({ bufnr = 0 })
                            if #clients == 0 then
                                return "No LSP"
                            end
                            local names = vim.tbl_map(function(c)
                                return c.name
                            end, clients)
                            return "[" .. table.concat(names, ", ") .. "]"
                        end,
                        icon = " ",
                        color = { fg = "#ffffff", gui = "bold" },
                    },
                    "diagnostics",
                    "selectioncount",
                    "filetype",
                    "searchcount",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        path = 1, -- relative path
                        symbols = {
                            modified = "[+]",
                            readonly = "[-]",
                            unnamed = "[No Name]",
                        },
                    },
                },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "neo-tree", "lazy", "trouble", "toggleterm", "fugitive" },
        },
    },
}
