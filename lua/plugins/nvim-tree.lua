return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer Sidebar" },
			{ "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer (VS Code Ctrl+B)" },
			{ "<leader>fe", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal Current File in Explorer" },
		},
		opts = {
			hijack_netrw = true,
			auto_reload_on_write = true,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				width = 32,
				side = "left",
				relativenumber = false,
			},
			renderer = {
				group_empty = true,
				highlight_git = true,
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "⌥",
							renamed = "➜",
							untracked = "★",
							deleted = "⊖",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = { "^.git$" },
			},
			trash = {
				cmd = "gio trash",
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
					window_picker = {
						enable = false,
					},
				},
			},
		},
	},
}
