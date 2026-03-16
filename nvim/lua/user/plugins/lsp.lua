return {
	{
		"neovim/nvim-lspconfig",
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
					},
				},
			},
		},
	},
}
