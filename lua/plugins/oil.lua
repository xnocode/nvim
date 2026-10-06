local function close_oil_and_preview()
	local ok_oil, oil = pcall(require, "oil")
	local ok_util, util = pcall(require, "oil.util")
	if ok_util then
		local winid = util.get_preview_win()
		if winid and vim.api.nvim_win_is_valid(winid) then
			pcall(vim.api.nvim_win_close, winid, true)
		end
	end
	if ok_oil then
		pcall(oil.close)
	end
end

local function select_and_close_preview()
	local ok_util, util = pcall(require, "oil.util")
	if ok_util then
		local winid = util.get_preview_win()
		if winid and vim.api.nvim_win_is_valid(winid) then
			pcall(vim.api.nvim_win_close, winid, true)
		end
	end
	require("oil.actions").select.callback()
end

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
			preview_win = {
				update_on_cursor_moved = true,
				preview_method = "fast_scratch",
				disable_preview = function(_)
					return false
				end,
				win_options = {},
			},
			float = {
				padding = 2,
				max_width = 120,
				max_height = 0,
				border = "rounded",
				preview_split = "right",
				win_options = {
					winblend = 0,
				},
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = select_and_close_preview,
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["P"] = "actions.preview",
				["K"] = "actions.preview",
				["<C-d>"] = "actions.preview_scroll_down",
				["<C-u>"] = "actions.preview_scroll_up",
				["<C-c>"] = close_oil_and_preview,
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
				["q"] = close_oil_and_preview,
				["<leader>e"] = close_oil_and_preview,
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					local oil = require("oil")
					if vim.bo.filetype == "oil" then
						close_oil_and_preview()
					else
						oil.open(nil, { preview = { vertical = true } })
					end
				end,
				desc = "Toggle Oil with Live Preview (<Space>e)",
			},
			{
				"<C-b>",
				function()
					local oil = require("oil")
					if vim.bo.filetype == "oil" then
						close_oil_and_preview()
					else
						oil.open(nil, { preview = { vertical = true } })
					end
				end,
				desc = "Toggle Oil with Live Preview (Ctrl+B)",
			},
			{
				"-",
				function()
					require("oil").open(nil, { preview = { vertical = true } })
				end,
				desc = "Open Parent Directory with Preview (Oil)",
			},
			{
				"<leader>fe",
				function()
					require("oil").open(nil, { preview = { vertical = true } })
				end,
				desc = "Explore Current Folder in Oil",
			},
			{
				"<leader>E",
				function()
					require("oil").toggle_float(nil, { preview = { vertical = true } })
				end,
				desc = "Open Oil in Floating Window (with Preview)",
			},
		},
	},
}
