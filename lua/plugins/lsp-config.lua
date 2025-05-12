return {
    {
        "williamboman/mason.nvim",
        version = "^1.0.0",
        lazy = false,
        cmd = 'Mason',
        config = function()
            require("mason").setup()
        end
    },
    {
        "github/copilot.vim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "^1.0.0",
        lazy = false,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = true,
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "tailwindcss",
                    -- "omnisharp",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "Hoffs/omnisharp-extended-lsp.nvim", -- required for extended C# support
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Set up omnisharp using mason's path
            local mason_registry = require("mason-registry")
            local omnisharp_path = mason_registry.get_package("omnisharp"):get_install_path()
                .. "/OmniSharp.dll"

            lspconfig.omnisharp.setup({
                cmd = { "dotnet", omnisharp_path },
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
                capabilities = capabilities,
                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended").handler,
                },
                -- handlers = {
                --     ["textDocument/definition"] = function(...)
                --         return require("omnisharp_extended").handler(...)
                --     end,
                -- },
            })

            -- Setup other LSPs
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({ capabilities = capabilities })

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            -- If want better omnisharp symbol resolution,
            vim.keymap.set("n", "gd", function()
                require("omnisharp_extended").telescope_lsp_definitions()
            end, { desc = "Omnisharp Go to Definition" })
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        modes = {
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = "{0,-2}",
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                },
            },
            -- test = {
            --     mode = "diagnostics",
            --     preview = {
            --         type = "split",
            --         relative = "win",
            --         position = "right",
            --         size = 0.3,
            --     },
            -- },
        },
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'rcarriga/nvim-dap-ui',
        },
        event = 'VeryLazy',
        config = function()
            require("dapui").setup({
                icons = { expanded = "▾", collapsed = "▸" },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 10, -- columns
                        position = "bottom",
                    },
                },
            })
        end
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup()
        end

    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- required for capabilities
            ...
        },
        ...
    },
    {
        "Hoffs/omnisharp-extended-lsp.nvim",
        lazy = true,
    }

    --   UNCOMMENT IF NOT USING CODE
    --   -- Snippet Engine and Friendly Snippets
    --   {
    --       'L3MON4D3/LuaSnip',
    --       dependencies = { 'rafamadriz/friendly-snippets' },
    --       config = function()
    --           require("luasnip.loaders.from_vscode").lazy_load()
    --       end,
    --   },
    --
    -- {
    --     "stevearc/quicker.nvim",
    --     event = "Filemtype qf",
    --     ---@module "quicker",
    --     ---@type quicker.SetupOptions
    --     opts = {},
    -- },
}
