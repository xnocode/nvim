local function open_floating_terminal(cmd, title)
	local width = math.min(100, math.floor(vim.o.columns * 0.85))
	local height = math.min(28, math.floor(vim.o.lines * 0.8))
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded",
		title = " " .. (title or "Terminal") .. " ",
		title_pos = "center",
	})

	vim.fn.termopen(cmd, {
		on_exit = function()
			vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
			vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
			vim.keymap.set("t", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })
		end,
	})
	vim.cmd("startinsert")
end

local function submit_codeforces()
	local fname = vim.fn.expand("%:p")
	if fname == "" then
		vim.notify("⚠️ Please save your file before submitting.", vim.log.levels.WARN)
		return
	end
	vim.cmd("silent! write")
	open_floating_terminal("cf-submit " .. vim.fn.fnameescape(fname), "🚀 Codeforces")
end

local function submit_atcoder()
	local fname = vim.fn.expand("%:p")
	if fname == "" then
		vim.notify("⚠️ Please save your file before submitting.", vim.log.levels.WARN)
		return
	end
	vim.cmd("silent! write")
	open_floating_terminal("acc submit " .. vim.fn.fnameescape(fname), "⚡ AtCoder")
end

-- Helper to switch/create another language file in the same problem folder
local function switch_problem_lang(target_ext)
	local cur_path = vim.fn.expand("%:p")
	if cur_path == "" then
		vim.notify("⚠️ No problem file currently open.", vim.log.levels.WARN)
		return
	end
	local no_ext = vim.fn.expand("%:p:r")
	local target_file = no_ext .. "." .. target_ext
	vim.cmd("edit " .. vim.fn.fnameescape(target_file))
	vim.notify("📁 Switched to " .. target_ext:upper() .. ": " .. vim.fn.fnamemodify(target_file, ":t"), vim.log.levels.INFO, { title = "CP Language Switcher" })
end

-- Helper to dynamically route and tag problem paths
local function resolve_received_problem_path(task, file_extension)
	local judge = "Other"
	local problem_code = task.name or "problem"

	if task.url then
		local url = task.url
		-- Codeforces contest problem: /contest/4/problem/A
		local cf_c, cf_p = url:match("codeforces%.com/contest/(%d+)/problem/([%w]+)")
		if not cf_c then
			-- Codeforces problemset problem: /problemset/problem/4/A
			cf_c, cf_p = url:match("codeforces%.com/problemset/problem/(%d+)/([%w]+)")
		end
		if cf_c and cf_p then
			judge = "Codeforces"
			problem_code = cf_c .. cf_p:upper()
		elseif url:match("atcoder%.jp") then
			judge = "AtCoder"
			local ac_task = url:match("tasks/([%w_]+)")
			if ac_task then
				problem_code = ac_task
			end
		end
	end

	local homedir = vim.loop.os_homedir()
	local dir = string.format("%s/Downloads/programming/cp/%s/%s", homedir, judge, problem_code)
	vim.fn.mkdir(dir, "p")

	-- Write .problem.json metadata file so submitters always know the exact problem code
	local meta_file = dir .. "/.problem.json"
	local f = io.open(meta_file, "w")
	if f then
		f:write(vim.fn.json_encode({
			code = problem_code,
			name = task.name or problem_code,
			judge = judge,
			url = task.url or "",
		}))
		f:close()
	end

	return string.format("%s/%s.%s", dir, problem_code, file_extension)
end

return {
	{
		"xeluxee/competitest.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		keys = {
			{ "<leader>tr", "<cmd>CompetiTest run<cr>", desc = "Run Test Cases (Visual Popup)" },
			{ "<leader>cs", submit_codeforces, desc = "Submit to Codeforces (cs)" },
			{ "<leader>ts", submit_codeforces, desc = "Submit to Codeforces" },
			{ "<leader>as", submit_atcoder, desc = "Submit to AtCoder (acc submit)" },
			{ "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Custom Test Case" },
			{ "<leader>te", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit Test Case" },
			{ "<leader>td", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete Test Case" },
			{ "<leader>tu", "<cmd>CompetiTest show_ui<cr>", desc = "Toggle Results Popup" },
			-- Language switchers inside the same problem folder
			{ "<leader>tc", function() switch_problem_lang("cpp") end, desc = "Problem: Open C++ (.cpp)" },
			{ "<leader>tp", function() switch_problem_lang("py") end, desc = "Problem: Open Python (.py)" },
			{ "<leader>tg", function() switch_problem_lang("rs") end, desc = "Problem: Open Rust (.rs)" },
		},
		opts = {
			start_receiving_persistently_on_setup = true,
			companion_port = 27121,
			receive_print_message = true,
			save_current_file = true,
			save_all_files = false,
			open_received_problems = true,
			open_received_contests = true,
			replace_received_testcases = true,
			received_problems_prompt_path = false,
			received_contests_prompt_directory = false,
			received_contests_prompt_extension = false,
			received_files_extension = "cpp",
			received_problems_path = resolve_received_problem_path,
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
