return {
	-- "bluz71/vim-nightfly-colors",
	"Mofiqul/dracula.nvim",
	priority = 1000,
	config = function()
		-- load colorscheme here
		vim.cmd([[colorscheme dracula]])
	end,
}
