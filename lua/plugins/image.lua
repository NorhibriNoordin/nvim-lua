return {
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin should load as early as possible
        opts = {
          rocks = { "magick" },
        },
      },
    },
    config = function()
      require("image").setup({
        backend = "kitty", -- "kitty" works for WezTerm too
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- extend filetypes for markdown images
          },
          neotree = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "png", "jpg", "jpeg", "gif", "webp" },
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false, -- toggles images when windows overlap
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false, -- auto-hide images when editor loses focus
        tmux_show_only_in_active_window = false, -- auto-hide images when tmux window loses focus
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
      })
    end,
  },
}
