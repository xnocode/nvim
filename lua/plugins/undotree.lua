return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree (Time Machine)" },
			{ "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree (Time Machine)" },
		},
		config = function()
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_SplitWidth = 35
			vim.g.undotree_DiffpanelHeight = 10
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_ShortIndicators = 1
		end,
	},
}
