return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "thin",
          always_show_bufferline = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true,
          diagnostics = "nvim_lsp",
          name_formatter = function(buf)
            local name = buf.name
            if name and name:match("^oil://") then
              return "Explorer"
            end
            return vim.fn.fnamemodify(name, ":t")
          end,
          indicator = { style = "none" },
          show_buffer_icons = true,
          show_tab_indicators = false,
          persist_buffer_sort = true,
          italic = false,
        },
        highlights = {
          buffer_selected = { italic = false, bold = true },
          modified_selected = { italic = false },
        },
      })

      -- Tab navigation
      vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Tab" })
      vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })
      vim.keymap.set("n", "<C-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Tab Left" })
      vim.keymap.set("n", "<C-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Tab Right" })
    end,
  },
}
