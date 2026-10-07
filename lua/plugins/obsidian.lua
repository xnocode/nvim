return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			workspaces = {
				{
					name = "garden",
					path = "~/garden/content",
				},
			},
			completion = {
				nvim_cmp = false,
				blink = true,
				min_chars = 2,
			},
			mappings = {
				-- 'gf' follows wiki links
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle checkboxes
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				-- Smart action (follow link, toggle checkbox)
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			note_id_func = function(title)
				if title ~= nil then
					return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					return tostring(os.time())
				end
			end,
			attachments = {
				img_folder = "Attachments",
			},
			ui = {
				enable = false, -- Handled seamlessly by render-markdown.nvim
			},
		},
		keys = {
			{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian: Search Vault" },
			{ "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: Quick Switch Notes" },
			{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian: Create New Note" },
			{ "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Obsidian: Today's Daily Note" },
			{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian: Show Backlinks" },
			{ "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Obsidian: All Note Links" },
			{ "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Obsidian: Open in Desktop App" },
		},
	},
}
