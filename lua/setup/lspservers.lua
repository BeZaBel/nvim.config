local servers = {
	lua_ls = {
		Lua = {
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
				disable = { "missing-fields" },
			},
			workspace = {
				-- checkThirdParty = false,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					-- "~/.local/share/nvim/lazy/fluoromachine.nvim",
				},
			},
			-- hint = {
			--     enable = true,
			-- },
		},
	},
	marksman = {},
	markdown_oxide = {},
	clangd = {
		clangd = {
			filetypes = {
				"c",
				"cpp",
			},
			root_pattern = {
				".clangd-format",
			},
		},
	},
	rust_analyzer = {},
	r_language_server = {},
	texlab = {
		texlab = {
			build = {
				executable = "latexmk",
				args = {
					"-pdf",
					-- "compile",
					"%f",
				},
				onSave = true,
			},
		},
	},
	ltex = {
		ltex = {
			language = "es",
			enabled = false,
		},
		filetypes = {
			"bib",
			"tex",
		},
	},
	pyright = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

return servers
