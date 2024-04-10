local colorschemes = {
	['nightfly'] = 'bluz71/vim-nightfly-colors',
	['dracula'] = 'Mofiqul/dracula.nvim',
	['tokyonight'] = 'folke/tokyonight.nvim', -- night, storm, day, moon
	['catppuccin'] = 'catppuccin/nvim', -- latte, frappe, macchiato, mocha
	['gruvbox'] = 'ellisonleao/gruvbox.nvim',
	['wal'] = 'dylanaraps/wal.vim'
}

local selectedColorscheme = 'wal' --change here
local style = ''

return {
	colorschemes[selectedColorscheme],
	lazy = false,
	priority = 1000,
	config = function()
		-- load colorscheme here
		local cmd = 'colorscheme ' .. selectedColorscheme .. style
		vim.cmd(cmd)
	end,
}
