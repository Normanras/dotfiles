return {
  'linguini1/pulse.nvim',
--	'Normanras/pulse.nvim',
    version = "*",
	config = function()

	  local pulse = require("pulse")

	  pulse.setup({level = vim.log.levels.ERROR})

	  pulse.add("Send Krista Message", {
			interval = 90,
			message = "Tell Krista that you love her!",
			enabled = True,
			})
  end
}

-- Not working: DEBUG, TRACE
-- Working: ERROR, OFF, WARN, INFO
