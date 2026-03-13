function ColorMyPencils(color)
    color = color or "catppuccin"

    require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
            bufferline = true,
            nvimtree = true,
            treesitter = true,
            telescope = true,
        }
    })

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "@underline", { link = "Underlined" })
end

ColorMyPencils()
