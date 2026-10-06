return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"cmake",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			local ok, ts = pcall(require, "nvim-treesitter.configs")
			if ok then
				ts.setup(opts)
			end
			-- MDX support
			vim.filetype.add({ extension = { mdx = "mdx" } })
			pcall(function()
				vim.treesitter.language.register("markdown", "mdx")
			end)
		end,
	},
}
