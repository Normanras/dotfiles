return {
  'linguini1/pulse.nvim',
--	'Normanras/pulse.nvim',
    version = "*",
	config = function()

	  local pulse = require("pulse")

	  pulse.setup({level = vim.log.levels.ERROR})

	  pulse.add("Send Test Message", {
			interval = 1,
			message = "This is a Test!",
			enabled = True,
			})
  end
}

-- Not working: DEBUG, TRACE
-- Working: ERROR, OFF, WARN, INFO
