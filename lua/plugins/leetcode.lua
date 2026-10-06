return {
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Leet",
		keys = {
			{ "<leader>L", "<cmd>Leet<cr>", desc = "Open LeetCode Dashboard" },
			{ "<leader>lt", "<cmd>Leet test<cr>", desc = "LeetCode: Run Test Cases" },
			{ "<leader>ls", "<cmd>Leet submit<cr>", desc = "LeetCode: Submit Solution" },
			{ "<leader>ll", "<cmd>Leet list<cr>", desc = "LeetCode: List Problems" },
			{ "<leader>ld", "<cmd>Leet desc<cr>", desc = "LeetCode: Show Problem Description" },
			{ "<leader>lr", "<cmd>Leet random<cr>", desc = "LeetCode: Pick Random Problem" },
			{ "<leader>lq", "<cmd>Leet exit<cr>", desc = "LeetCode: Exit / Close" },
		},
		opts = {
			lang = "cpp",
			storage = {
				home = vim.fn.expand("~/Downloads/programming/leetcode"),
				cache = vim.fn.stdpath("cache") .. "/leetcode",
			},
			logging = true,
			injector = {
				["cpp"] = {
					before = { "#include <bits/stdc++.h>", "using namespace std;" },
					after = "int main() { return 0; }",
				},
			},
			description = {
				position = "left",
				width = "40%",
				show_stats = true,
			},
		},
	},
}
