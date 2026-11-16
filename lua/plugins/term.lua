return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { { [[<C-\>]], desc = "Toggle terminal" } },
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
        open_mapping = [[<C-\>]],
        shell = vim.fn.executable("pwsh") == 1 and "pwsh" or vim.o.shell,
    },
}
