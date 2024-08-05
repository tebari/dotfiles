return {
	{
		"stevearc/oil.nvim",
		keys = {
			{
				"-",
				"<cmd>Oil<cr>",
				desc = "Open parent directory",
                mode = "n",
			},
		},
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
}
