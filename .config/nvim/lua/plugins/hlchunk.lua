return {
	"shellRaining/hlchunk.nvim",
	enabled = true,
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				use_treesitter = false,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				style = {
					"#806d9c",
					"#00ffff",
				},
			},
			indent = {
				enable = true,
			},
			blank = {
				enable = false,
			},
			line_num = {
				enable = true,
				use_treesitter = false,
			},
		})
	end,
}
