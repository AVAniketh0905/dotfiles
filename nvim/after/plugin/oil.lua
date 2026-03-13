-- Keymap
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
    },
    keymaps = {
        ["<CR>"] = "actions.select",
        ["v"] = "actions.select_vsplit",
        ["s"] = "actions.select_split",
        ["t"] = "actions.select_tab",

        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",

        ["g."] = "actions.toggle_hidden",
        ["q"] = "actions.close",
    },
    float = {
        padding = 2,
        max_width = 80,
        max_height = 30,
    },
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
})
