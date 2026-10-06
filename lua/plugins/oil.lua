return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			default_file_explorer = false, -- Handled by Snacks Explorer / Telescope
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
				max_width = 100,
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
			},
		},
		keys = {
			{
				"-",
				function()
					require("oil").open()
				end,
				desc = "Open Parent Directory in Oil (Buffer Editor)",
			},
			{
				"<leader>O",
				function()
					require("oil").open()
				end,
				desc = "Open Oil Buffer File Editor",
			},
		},
	},
}
