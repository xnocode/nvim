local function submit_codeforces()
	local fname = vim.fn.expand("%:p")
	if fname == "" then
		vim.notify("⚠️ Please save your file before submitting.", vim.log.levels.WARN)
		return
	end
	vim.cmd("silent! write")
	vim.notify("🚀 Submitting to Codeforces...", vim.log.levels.INFO, { title = "Codeforces Submit" })
	vim.cmd("split | terminal cf-submit " .. vim.fn.fnameescape(fname))
end




local function submit_atcoder()
	local fname = vim.fn.expand("%:p")
	if fname == "" then
		vim.notify("⚠️ Please save your file before submitting.", vim.log.levels.WARN)
		return
	end
	vim.cmd("silent! write")
	vim.notify("🚀 Submitting to AtCoder via acc...", vim.log.levels.INFO, { title = "AtCoder CLI" })
	vim.cmd("split | terminal acc submit " .. vim.fn.fnameescape(fname))
end

return {
	{
		"xeluxee/competitest.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = { "CompetiTest" },
		init = function()
			-- Start local bridge daemon silently in background
			pcall(vim.fn.jobstart, { "python3", vim.fn.expand("~/.local/bin/cp_bridge.py") })
		end,
		keys = {
			{ "<leader>tr", "<cmd>CompetiTest run<cr>", desc = "Run Test Cases (Visual Popup)" },
			{ "<leader>cs", submit_codeforces, desc = "Submit to Codeforces (cs)" },
			{ "<leader>ts", submit_codeforces, desc = "Submit to Codeforces (via Browser Bridge)" },
			{ "<leader>as", submit_atcoder, desc = "Submit to AtCoder (via acc submit)" },
			{ "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Custom Test Case" },
			{ "<leader>te", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit Test Case" },
			{ "<leader>td", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete Test Case" },
			{ "<leader>tp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive Problem" },
			{ "<leader>tc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive Entire Contest" },
			{ "<leader>tu", "<cmd>CompetiTest show_ui<cr>", desc = "Toggle Results Popup" },
		},
		opts = {
			start_receiving_persistently_on_setup = true,
			received_problems_path = "$(HOME)/Downloads/programming/cp/$(JUDGE)/$(PROBLEM)/$(PROBLEM).$(FEXT)",
			received_contests_directory = "$(HOME)/Downloads/programming/cp/$(JUDGE)/$(CONTEST)",
			received_contests_problems_path = "$(PROBLEM)/$(PROBLEM).$(FEXT)",
			compile_directory = ".",
			compile_command = {
				c = { exec = "gcc", args = { "-Wall", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
				cpp = { exec = "g++", args = { "-std=c++20", "-Wall", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
				rust = { exec = "rustc", args = { "$(FNAME)" } },
			},
			run_command = {
				c = { exec = "./$(FNOEXT)" },
				cpp = { exec = "./$(FNOEXT)" },
				rust = { exec = "./$(FNOEXT)" },
				python = { exec = "python3", args = { "$(FNAME)" } },
			},
			testcases_directory = ".",
			testcases_use_single_file = false,
			testcases_auto_detect_storage = true,
			companion_port = 27121,
			receive_print_message = true,
			save_current_file = true,
			save_all_files = false,
			runner_ui = {
				interface = "popup",
				selector_show_nu = false,
				selector_show_rnu = false,
				show_nu = true,
				show_rnu = false,
				mappings = {
					run_again = "r",
					run_all_again = "R",
					kill = "K",
					kill_all = "<C-k>",
					view_input = "i",
					view_output = "a",
					view_stdout = "o",
					view_stderr = "e",
					toggle_diff = "d",
					close = { "q", "<Esc>" },
				},
				viewer = {
					width = 0.6,
					height = 0.6,
					show_nu = true,
					show_rnu = false,
					open_when_compilation_fails = true,
				},
			},
			popup_ui = {
				total_width = 0.85,
				total_height = 0.85,
				layout = {
					{ 4, "tc" },
					{ 5, { { 1, "so" }, { 1, "si" } } },
					{ 5, { { 1, "eo" }, { 1, "se" } } },
				},
			},
			view_output_diff = false,
			output_compare_method = "squish",
		},
	},
}
