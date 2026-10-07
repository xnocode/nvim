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

			-- Compatibility fix for Neovim 0.12+ query directives where captures are passed as tables
			pcall(function()
				local query = vim.treesitter.query
				query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
					local capture_id = pred[2]
					local node = match[capture_id]
					if type(node) == "table" then
						node = node[#node] or node[1]
					end
					if not node or type(node) ~= "userdata" or type(node.range) ~= "function" then
						return
					end
					local ok_text, text = pcall(vim.treesitter.get_node_text, node, bufnr)
					if ok_text and text then
						metadata["injection.language"] = text:lower()
					end
				end, { force = true, all = false })
			end)
		end,
	},
}
