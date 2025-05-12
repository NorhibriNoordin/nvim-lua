-- return {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}

-- uses buffers complicated to navigate between tabs
-- return {
--   "akinsho/bufferline.nvim",
--   version = "*", -- always latest version
--   dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons for file types
--   config = function()
--     require("bufferline").setup({
--       options = {
--         mode = "buffers", -- set to "tabs" if you want tabpage tabs instead
--         numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both"
--         close_command = "bdelete! %d", -- close buffer
--         right_mouse_command = "bdelete! %d", -- right-click to close
--         offsets = {
--           {
--             filetype = "NvimTree", -- if you use NeoTree or NvimTree
--             text = "File Explorer",
--             highlight = "Directory",
--             text_align = "center",
--             separator = true,
--           },
--         },
--         diagnostics = "nvim_lsp", -- show lsp errors on tabs
--         diagnostics_indicator = function(count, level)
--           local icon = level:match("error") and " " or " "
--           return " " .. icon .. count
--         end,
--         separator_style = "slant", -- options: "slant" | "thick" | "thin" | {"left", "right"}
--         enforce_regular_tabs = false,
--         always_show_bufferline = true,
--         show_buffer_close_icons = true,
--         show_close_icon = false,
--       },
--       highlights = {
--         fill = {
--           bg = "#1e1e2e", -- optional: custom background color
--         },
--       },
--     })
--   end,
-- }

return {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
  config = function()
    require('tabby.tabline').use_preset('tab_only', {
      -- nerdfont = true, -- if you have a NerdFont installed
      lualine_theme = 'dracula',
    })
  end
}

-- plugins/tabby.lua

