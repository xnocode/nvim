local wakatime_cache = ""

local function update_wakatime()
	vim.system({ "wakatime-cli", "--today" }, { text = true }, function(obj)
		if obj.code == 0 and obj.stdout and obj.stdout ~= "" then
			local trimmed = vim.trim(obj.stdout)
			if trimmed ~= "" then
				wakatime_cache = trimmed
			end
		end
	end)
end

-- Refresh periodically in background without any UI blocking
local timer = vim.uv.new_timer()
if timer then
	timer:start(1000, 120000, vim.schedule_wrap(update_wakatime))
end

vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
	callback = function()
		vim.defer_fn(update_wakatime, 2500)
	end,
})

return {
	{
		"wakatime/vim-wakatime",
		lazy = false,
		opts = {
			status_bar_enabled = false,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			opts.sections = opts.sections or {}
			opts.sections.lualine_x = opts.sections.lualine_x or {}

			-- Remove any plain/duplicate wakatime component from lualine_x
			for i = #opts.sections.lualine_x, 1, -1 do
				local comp = opts.sections.lualine_x[i]
				if type(comp) == "table" and comp.__wakatime_statusline then
					table.remove(opts.sections.lualine_x, i)
				end
			end

			-- Insert single, beautifully styled WakaTime component with clock icon
			table.insert(opts.sections.lualine_x, 1, {
				function()
					if wakatime_cache ~= "" then
						return "󱑆 " .. wakatime_cache
					end
					return "󱑆 0 mins"
				end,
				color = { fg = "#00d2ff", gui = "bold" },
			})
		end,
	},
}
