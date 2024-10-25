local colorschemes = {
	["nightfly"] = "bluz71/vim-nightfly-colors",
	["dracula"] = "Mofiqul/dracula.nvim",
	["tokyonight"] = "folke/tokyonight.nvim", -- night, storm, day, moon
	["catppuccin"] = "catppuccin/nvim", -- latte, frappe, macchiato, mocha
	["gruvbox"] = "ellisonleao/gruvbox.nvim",
	["pywal"] = "AlphaTechnolog/pywal.nvim",
	["nord"] = "shaunsingh/nord.nvim",
	["material"] = "marko-cerovac/material.nvim",
	["papercolor"] = "NLKNguyen/papercolor-theme",
	["ayu"] = "ayu-theme/ayu-vim",
	["github"] = "projekt0n/github-nvim-theme",
	["solarized"] = "ishan9299/nvim-solarized-lua",
	["rose-pine"] = "rose-pine/neovim",
	["gruvchad"] = "sainnhe/gruvbox-material",
	["sonokai"] = "sainnhe/sonokai",
	["monokai"] = "tiagovla/tokyodark.nvim",
	["onedark"] = "navarasu/onedark.nvim",
	["moonfly"] = "bluz71/vim-moonfly-colors",
	["github_light"] = "projekt0n/github-nvim-theme",
	["github_dark"] = "projekt0n/github-nvim-theme",
	["github_dimmed"] = "projekt0n/github-nvim-theme",
	["habamax"] = "habamax/vim-habamax",
}

local selectedColorscheme = "habamax" --change here
local style = "-night"

return {
	colorschemes[selectedColorscheme],
	enabled = true,
	lazy = false,
	priority = 1000,
	config = function()
		-- load colorscheme here
		-- local cmd = "colorscheme " .. selectedColorscheme .. style
		local cmd = "colorscheme " .. selectedColorscheme
		vim.cmd(cmd)
	end,
}
