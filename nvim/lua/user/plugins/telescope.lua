return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

      {
        "<leader>dw",
        function()
          require("telescope.builtin").diagnostics({
            bufnr = nil,
            path_display = { "smart" },
          })
        end,
        desc = "Workspace Diagnostics",
      },

      {
        "<leader>db",
        function()
          require("telescope.builtin").diagnostics({ bufnr = 0 })
        end,
        desc = "Buffer Diagnostics",
      },
    },

    opts = function(_, opts)
      opts = opts or {}
      opts.defaults = opts.defaults or {}

      -- layout tweaks
      opts.defaults.layout_strategy = "horizontal"
      opts.defaults.layout_config = {
        horizontal = {
          preview_width = 0.56,
          results_width = 0.8,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      }

      -- ignore patterns
      opts.defaults.file_ignore_patterns = {
        "%.env",
        "%.venv",
        "node_modules",
        "dist",
      }

      -- ripgrep tuning
      opts.defaults.vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--glob",
        "!.venv/**",
        "--glob",
        "!.env/**",
        "--glob",
        "!node_modules/**",
        "--glob",
        "!.git/**",
        "--glob",
        "!dist/**",
      }
    end,
  },
}
