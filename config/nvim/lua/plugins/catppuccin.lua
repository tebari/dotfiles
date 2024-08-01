return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
            -- Load colorscheme
            vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
}
