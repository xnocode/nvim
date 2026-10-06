return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".git"
				end,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
				["q"] = "actions.close",
				["<leader>e"] = "actions.close",
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					local oil = require("oil")
					if vim.bo.filetype == "oil" then
						oil.close()
					else
						oil.open()
					end
				end,
				desc = "Toggle Oil File Manager (<Space>e)",
			},
			{
				"<C-b>",
				function()
					local oil = require("oil")
					if vim.bo.filetype == "oil" then
						oil.close()
					else
						oil.open()
					end
				end,
				desc = "Toggle Oil File Manager (Ctrl+B)",
			},
			{
				"-",
				function()
					require("oil").open()
				end,
				desc = "Open Parent Directory (Oil)",
			},
			{
				"<leader>fe",
				function()
					require("oil").open()
				end,
				desc = "Explore Current Folder in Oil",
			},
			{
				"<leader>E",
				function()
					require("oil").toggle_float()
				end,
				desc = "Open Oil in Floating Window",
			},
		},
	},
}
