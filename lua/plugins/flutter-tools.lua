return {
    {
        "nvim-flutter/flutter-tools.nvim",
        ft = { "dart" },
        cmd = { "FlutterRun", "FlutterDevices", "FlutterEmulators" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            lsp = {
                capabilities = function(config)
                    return vim.tbl_deep_extend("force", config, require("cmp_nvim_lsp").default_capabilities())
                end,
            },
        },
    },
    {
        "wa11breaker/flutter-bloc.nvim",
        ft = { "dart" },
        dependencies = {
            "nvimtools/none-ls.nvim", -- Required for code actions
        },
        opts = {
            bloc_type = "default", -- Choose from: 'default', 'equatable', 'freezed'
            use_sealed_classes = false,
            enable_code_actions = true,
        },
    },
}
