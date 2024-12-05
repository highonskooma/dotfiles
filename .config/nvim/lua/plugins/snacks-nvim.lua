return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			sections = {
				-- { section = "header" },
				{
					section = "terminal",
					cmd = "chafa ~/Pictures/wallpapers/sunset.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
					height = 17,
					padding = 1,
				},
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
