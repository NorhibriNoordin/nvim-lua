return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "Hoffs/omnisharp-extended-lsp.nvim",
        },
        config = function()
            -- Shared defaults for every server (Neovim 0.11+ API)
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local function map(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
                    end
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    if client and client.name == "omnisharp" then
                        local ext = require("omnisharp_extended")
                        map("gd", ext.lsp_definition, "Go to definition (OmniSharp)")
                        map("<leader>gd", ext.lsp_definition, "Go to definition (OmniSharp)")
                        map("gD", ext.telescope_lsp_definition, "Definitions in Telescope (OmniSharp)")
                        map("<leader>gr", ext.lsp_references, "References (OmniSharp)")
                    else
                        map("gd", vim.lsp.buf.definition, "Go to definition")
                        map("<leader>gd", vim.lsp.buf.definition, "Go to definition")
                        map("<leader>gr", vim.lsp.buf.references, "References")
                    end
                    map("K", vim.lsp.buf.hover, "Hover")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                end,
            })

            -- Server overrides; defaults (cmd, filetypes, root markers) come from nvim-lspconfig.
            vim.lsp.config("omnisharp", {
                settings = {
                    FormattingOptions = { OrganizeImports = true },
                    RoslynExtensionsOptions = {
                        EnableAnalyzersSupport = true,
                        EnableImportCompletion = true,
                    },
                },
            })
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
                    },
                },
            })

            require("mason").setup()
            -- Installs servers and enables every installed one. dartls is handled by flutter-tools.
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "tailwindcss",
                    "omnisharp",
                    "angularls",
                },
                -- Both omnisharp packages are installed; running both doubles every C# result.
                automatic_enable = { exclude = { "omnisharp_mono" } },
            })
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)" },
            { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)" },
            { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
            { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)" },
            { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)" },
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach",
        config = function()
            require("tiny-inline-diagnostic").setup()
            vim.diagnostic.config({ virtual_text = false })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        build = "make install_jsregexp",
        -- VSCode-format snippet packs must be on the runtimepath before the loader scans it.
        dependencies = { "rafamadriz/friendly-snippets", "Nash0x7E2/awesome-flutter-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- Confirm when the menu is open, otherwise jump in a snippet, otherwise
                    -- fall through (copilot.vim accept / normal <Tab>).
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
            })
        end,
    },
}
