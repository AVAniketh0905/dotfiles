return {
  {
    "neovim/nvim-lspconfig",

    init = function()
      -- raylib / GLSL shader extensions
      vim.filetype.add({
        extension = {
          vs = "glsl",
          fs = "glsl",
          vert = "glsl",
          frag = "glsl",
          comp = "glsl",
        },
      })
    end,

    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "strict",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },

        gopls = {},
        lua_ls = {},

        clangd = {
          cmd = {
            "clangd",
            "--pretty",
            "--header-insertion=iwyu",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
            "--compile-commands-dir=build",

            -- for espressif projects
            "--query-driver=/home/avaniketh0905/.espressif/tools/**/bin/*gcc",
          },
        },

        glsl_analyzer = {
          filetypes = {
            "glsl",
          },
        },
      },
    },
  },
}
