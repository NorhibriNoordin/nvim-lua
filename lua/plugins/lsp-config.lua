return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        cmd = 'Mason',
        config = function()
            require("mason").setup()
        end
    },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     event = ""
    -- },
    {
        "github/copilot.vim",
        -- lazy = false,
        -- config = function()
        --     vim.g.copilot_no_tab_map = true
        --
        --     -- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#complete("<Tab>")', {silent = true, expr = true}) 
        --     -- vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#complete("<CR>")', {silent = true, expr = true}) 
        -- end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        event = {"BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                omnisharp = {
                    handlers = {
                        ["textDocument/definition"] = function(...)
                            return require("omnisharp_extended").handler(...)
                        end,
                    },
                    keys = {
                        {
                            "gd",
                            function()
                                if pcall(require, "telescope.nvim") then
                                    require("omnisharp_extended").telescope_lsp_definitions()
                                else
                                    require("omnisharp_extended").lsp_definitions()
                                end
                            end,
                            desc = "Goto Definition",
                        },
                    },
                    enable_roslyn_analyzers = true,
                    organize_imports_on_format = true,
                    enable_import_completion = true,
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "tailwindcss",
                    -- "omnisharp",
                }

            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.omnisharp.setup({
                cmd = { "omnisharp", "--languageserver" },
                capabilities = capabilities
            })

            -- lspconfig.omnisharp_mono.setup({
            --     cmd = 'omnisharp'
            -- })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
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
                    size = {width= 0.3, height = 0.3},
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

    }
    --   UNCOMMENT IF NOT USING CODE  COMPANIONKJKJKJ
  --   -- Snippet Engine and Friendly Snippets
  --   {
  --       'L3MON4D3/LuaSnip',
  --       dependencies = { 'rafamadriz/friendly-snippets' },
  --       config = function()
  --           require("luasnip.loaders.from_vscode").lazy_load()
  --       end,
  --   },
  --
  -- -- Completion Plugins
  --   {
  --       'hrsh7th/nvim-cmp',
  --       dependencies = {
  --           'hrsh7th/cmp-nvim-lsp',      -- LSP completions
  --           'saadparwaiz1/cmp_luasnip',  -- LuaSnip completions
  --           'hrsh7th/cmp-nvim-snippets',
  --       },
  --       config = function()
  --           local cmp = require'cmp'
  --           local luasnip = require'luasnip'
  --
  --           cmp.setup({
  --               snippet = {
  --                   expand = function(args)
  --                       luasnip.lsp_expand(args.body)
  --                   end,
  --               },
  --               sources = {
  --                   { name = 'nvim_lsp' },
  --                   { name = 'luasnip' },
  --                   { name = 'nvim-snippet' },
  --               },
  --               mapping = cmp.mapping.preset.insert({
  --                   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  --                   ['<C-Space>'] = cmp.mapping.complete(),
  --                   ['<Tab>'] = cmp.mapping(function(fallback)
  --                       if cmp.visible() then
  --                           cmp.select_next_item()
  --                       elseif luasnip.expand_or_jumpable() then
  --                           luasnip.expand_or_jump()
  --                       else
  --                           fallback()
  --                       end
  --                   end, { 'i', 's' }),
  --                   ['<S-Tab>'] = cmp.mapping(function(fallback)
  --                       if cmp.visible() then
  --                           cmp.select_prev_item()
  --                       elseif luasnip.jumpable(-1) then
  --                           luasnip.jump(-1)
  --                       else
  --                           fallback()
  --                       end
  --                   end, { 'i', 's' }),
  --               }),
  --           })
  --       end,
  --   },
    -- {
    --     "stevearc/quicker.nvim",
    --     event = "Filemtype qf",
    --     ---@module "quicker",
    --     ---@type quicker.SetupOptions
    --     opts = {},
    -- },
}
