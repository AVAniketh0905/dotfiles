require('lualine').setup({
    options = {
        theme = 'auto', -- Automatically fits your colorscheme
        component_separators = { left = '┃', right = '┃' },
        section_separators = { left = '', right = '' }, -- Slight slant for a modern feel
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return ' ' .. str end }
        },
        lualine_b = {
            { 'branch', icon = '' },
            {
                'diff',
                symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            },
        },
        lualine_c = {
            { 'filename', path = 1, symbols = { modified = ' ●', readonly = ' 󰖭' } },
            -- EXTRA: Macro Recording indicator (super helpful)
            {
                function()
                    local reg = vim.fn.reg_recording()
                    if reg == "" then return "" end
                    return "󰑋  RECORDING @" .. reg
                end,
                color = { fg = "#ff0000", gui = "bold" },
            },
        },
        lualine_x = {
            -- EXTRA: LSP Status (shows which server is active)
            {
                function()
                    local names = {}

                    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                        table.insert(names, client.name)
                    end

                    if #names == 0 then
                        return "No LSP"
                    end

                    return table.concat(names, ", ")
                end,
                icon = " ",
                color = { fg = "#ffffff", gui = "bold" },
            }
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
})
