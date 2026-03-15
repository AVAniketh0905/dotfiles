require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },

    formatters_by_ft = {
        python = { "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        go = { "gofmt" },
    },
})

-- optional keymap
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end)
