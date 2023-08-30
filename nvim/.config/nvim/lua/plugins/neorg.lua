 return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      { "nvim-lua/plenary.nvim",
        "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" },
    },
  },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
	  ["core.integrations.nvim-cmp"] = {},
	  ["core.integrations.treesitter"] = {},
	  ["core.highlights"] = {},
	  ["core.export"] = {},
	  ["core.mode"] = {},
	  ["core.itero"] = {},
	  ["core.keybinds"] = {
	    config = {
	      hook =  function(keybinds)
		keybinds.remap_key("norg", "n", "<M-CR>", "<S-tab>")
	      end,
	    }
	  },
	  ["core.completion"] = {
	    config = {
	      engine = "nvim-cmp"
	    },
	  },
          ["core.dirman"] = {
            config = {
              workspaces = {
                customer_notes = "~/Documents/Work/Customer_Notes/",
              },
            },
          },
        },
      }
    end,
  }
