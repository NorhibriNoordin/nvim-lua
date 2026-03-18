return {
	{
		"williamboman/mason.nvim",
		version = "^1.0.0",
		lazy = false,
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
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
				ensure_installed = {
					"lua_ls",
					"html",
					"tailwindcss",
					-- "dart", -- Managed by flutter-tools
					"omnisharp",
					"angularls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim", -- required for extended C# support
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig/util")

			-- Set up omnisharp path
			local mason_registry = require("mason-registry")
			local omnisharp_pkg = mason_registry.get_package("omnisharp")
			local omnisharp_path = ""
			local omnisharp_exe = ""

			if omnisharp_pkg:is_installed() then
				local install_path = omnisharp_pkg:get_install_path()
				omnisharp_path = install_path .. "/OmniSharp.dll"
				omnisharp_exe = install_path .. "/libexec/OmniSharp.exe"
			end

			-- LSP Keybindings (using LspAttach for buffer-local maps)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Special mapping for OmniSharp
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.name == "omnisharp" then
						vim.keymap.set("n", "gD", function()
							require("omnisharp_extended").telescope_lsp_definitions()
						end, { buffer = ev.buf, desc = "Omnisharp Go to Definition" })
					end
				end,
			})

			-- Configure Servers using the new Neovim 0.11+ API
			
			-- OmniSharp
			local omnisharp_cmd = { "dotnet", omnisharp_path }
			if vim.fn.has("win32") == 1 and vim.fn.filereadable(omnisharp_exe) == 1 then
				omnisharp_cmd = { omnisharp_exe, "--stdio" }
			end

			vim.lsp.config("omnisharp", {
				cmd = omnisharp_cmd,
				capabilities = capabilities,
				enable_roslyn_analyzers = true,
				organize_imports_on_format = true,
				enable_import_completion = true,
				root_dir = util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json", ".git"),
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").handler,
				},
			})
			vim.lsp.enable("omnisharp")

			-- Angular
			local angular_root = util.root_pattern("angular.json", "workspace.json", "project.json")
			local local_language_server = vim.fn.getcwd() .. "/node_modules/@angular/language-server/index.js"
			local angular_cmd = {
				"angular-language-server",
				"--stdio",
				"--tsProbeLocations",
				".",
				"--ngProbeLocations",
				".",
			}
			if vim.fn.filereadable(local_language_server) == 1 then
				angular_cmd = {
					"node",
					local_language_server,
					"--stdio",
					"--tsProbeLocations",
					".",
					"--ngProbeLocations",
					".",
				}
			end

			vim.lsp.config("angularls", {
				capabilities = capabilities,
				root_dir = angular_root,
				cmd = angular_cmd,
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
			})
			vim.lsp.enable("angularls")

			-- Other servers
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.enable("html")

			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.enable("lua_ls")

			vim.lsp.config("tailwindcss", { capabilities = capabilities })
			vim.lsp.enable("tailwindcss")
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
			{ "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
		},
		event = "VeryLazy",
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
						size = 10,
						position = "bottom",
					},
				},
			})
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		lazy = true,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
			})
		end,
	},
}
