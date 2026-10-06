return {
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				fish = { "fish_indent" },
				python = { "ruff_format" },
				c = { "clang-format", lsp_format = "fallback" },
				cpp = { "clang-format", lsp_format = "fallback" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
		},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = { "n", "v" },
				desc = "Format Document (VS Code style)",
			},
			{
				"<M-F>",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = { "n", "v", "i" },
				desc = "Format Document (Alt+Shift+F like VS Code)",
			},
		},
	},
}
