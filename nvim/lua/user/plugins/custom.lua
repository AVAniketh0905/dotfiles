return {
  -- File explorer
  {
    "stevearc/oil.nvim",
    opts = {},
  },

  -- Git
  { "tpope/vim-fugitive" },

  -- Undo tree
  { "mbbill/undotree" },

  -- Tmux navigation
  { "christoomey/vim-tmux-navigator" },

  -- Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      file_types = { "markdown" },
      condition = function(buf)
        return vim.bo[buf].buftype == ""
      end,
    },
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },

  -- Surround
  {
    "nvim-mini/mini.surround",
    opts = {},
  },

  -- Telescope UI select
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
