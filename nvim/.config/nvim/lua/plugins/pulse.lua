return {
  'linguini1/pulse.nvim',
    version = "*",
	config = function()

	  local pulse = require("pulse")

	  pulse.setup({level = vim.log.levels.DEBUG})

			--  pulse.add("Send Krista Message", {
			-- interval = 60,
			-- message = "Tell Krista that you Love Her!",
			-- enabled = True,
			-- })
  end
}
