-- Code Runner & Interactive Terminal Suite
-- Allows writing code and executing it in real-time on the same page/split

local function close_runner_window()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    local name = vim.api.nvim_buf_get_name(buf)
    if ft == "crunner" or name:find("crunner") or name:find("code_runner") then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  local cur_win = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if win ~= cur_win and vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  pcall(vim.cmd, "RunClose")
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "crunner",
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true, desc = "Close Runner" })
    vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true, desc = "Close Runner" })
  end,
})

return {
  -- 1. CRAG666/code_runner.nvim: Execute files / snippets in split, float, or tab
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    keys = {
      {
        "<F5>",
        function()
          if vim.api.nvim_buf_get_name(0) == "" then
            vim.notify("⚠️ Please save your file first (:w filename.ext)", vim.log.levels.WARN, { title = "Code Runner" })
            return
          end
          vim.cmd("silent! write")
          vim.cmd("RunCode")
        end,
        desc = "Save & Run Code in Split",
      },
      {
        "<leader>rr",
        function()
          if vim.api.nvim_buf_get_name(0) == "" then
            vim.notify("⚠️ Please save your file first (:w filename.ext)", vim.log.levels.WARN, { title = "Code Runner" })
            return
          end
          vim.cmd("silent! write")
          vim.cmd("RunCode")
        end,
        desc = "Save & Run Code in Split",
      },
      { "<leader>rf", "<cmd>RunFile<cr>", desc = "Run File" },
      { "<leader>rc", close_runner_window, desc = "Close Runner Window" },
      { "<leader>rq", close_runner_window, desc = "Close Runner Window" },
    },
    opts = {
      mode = "term",
      startinsert = false,
      focus = false,
      before_run_filetype = function()
        if vim.api.nvim_buf_get_name(0) ~= "" then
          vim.cmd("silent! write")
        end
      end,
      filetype = {
        javascript = "node",
        typescript = "npx tsx",
        python = "python3 -u",
        sh = "bash",
        bash = "bash",
        fish = "fish",
        lua = "lua",
        rust = "cargo run",
        c = "cd $dir && gcc -std=c17 -O2 $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
        cpp = "cd $dir && g++ -std=c++20 -O2 $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
        go = "go run",
      },
    },
  },

  -- 2. iron.nvim: Interactive REPL (send lines, paragraphs, selections to REPL side-by-side)
  {
    "Vigemus/iron.nvim",
    cmd = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
    keys = {
      { "<leader>is", "<cmd>IronRepl<cr>", desc = "REPL: Open" },
      { "<leader>ir", "<cmd>IronRestart<cr>", desc = "REPL: Restart" },
      { "<leader>ih", "<cmd>IronHide<cr>", desc = "REPL: Hide" },
      { "<leader>il", function() require("iron.core").send_line() end, desc = "REPL: Send Line" },
      { "<leader>if", function() require("iron.core").send_file() end, desc = "REPL: Send File" },
    },
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = { command = { "bash" } },
            fish = { command = { "fish" } },
            python = { command = { "python3" } },
            javascript = { command = { "node" } },
            typescript = { command = { "npx", "tsx" } },
            lua = { command = { "lua" } },
          },
          repl_open_cmd = require("iron.view").split.vertical.rightbelow("40%"),
        },
        keymaps = {
          send_motion = "<leader>ic",
          visual_send = "<leader>ic",
          cr = "<leader>i<cr>",
          interrupt = "<leader>i<space>",
          exit = "<leader>iq",
          clear = "<leader>iL",
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      })
    end,
  },

  -- 3. toggleterm.nvim: Toggleable terminal splits (right, bottom, floating)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle Terminal" },
      { "<leader>tt", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Terminal: Bottom Split" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60<cr>", desc = "Terminal: Vertical Split" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal: Float" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 14
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.42)
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = false,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = "fish",
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    },
  },
}
