return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files() end,     desc = "Find files" },
            { "<leader>fg", function() require("telescope.builtin").live_grep() end,      desc = "Live grep" },
            { "<leader>fG", function() require("telescope.builtin").git_status() end,     desc = "Git status" },
            { "<leader>tb", function() require("telescope.builtin").buffers() end,        desc = "Buffers" },
            { "<leader>fh", function() require("telescope.builtin").search_history() end, desc = "Search history" },
            { "<leader>fs", function() require("telescope.builtin").grep_string() end,    desc = "Grep string" },
            { "<leader>fo", function() require("telescope.builtin").oldfiles() end,       desc = "Recent files" },
            { "<leader>fC", function() require("telescope.builtin").commands() end,       desc = "Commands" },
            { "<leader>fm", function() require("telescope.builtin").marks() end,          desc = "Marks" },
            { "<leader>fl", function() require("telescope.builtin").loclist() end,        desc = "Location list" },
            { "<leader>fd", function() require("telescope.builtin").diagnostics() end,    desc = "Diagnostics" },
            { "<leader>fk", function() require("telescope.builtin").keymaps() end,        desc = "Keymaps" },
        },
        init = function()
            -- Load telescope (and ui-select) the first time anything calls vim.ui.select.
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "telescope.nvim" } })
                return vim.ui.select(...)
            end
        end,
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            width = 0.90,
                            height = 0.8,
                            prompt_position = "bottom",
                            preview_cutoff = 0,   -- always show preview
                            preview_height = 0.6,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            telescope.load_extension("ui-select")
        end,
    },
}
