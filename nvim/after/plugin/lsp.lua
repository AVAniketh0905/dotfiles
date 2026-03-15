-- LSP Zero recommended preset
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- Optional: default keymaps
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
end)


-- Mason Setup
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright', -- Python LSP
        'gopls',   -- Go LSP
        'lua_ls',  -- Lua LSP
        'clangd',  -- C/Cpp LSP
    },
    handlers = {
        lsp.default_setup,
    }
})


-- esp-idf setup
vim.lsp.config.clangd = {
    cmd = {
        "clangd",
        "--pretty",
        "--header-insertion=iwyu",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--compile-commands-dir=build",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
}

vim.lsp.enable("clangd")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
})


-- Pyright
vim.lsp.config("pyright", {
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
})

-- Enable servers
vim.lsp.enable("pyright")
--

local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- LuaSnip as source
        { name = 'buffer' },
        { name = 'path' },
    }),
})
