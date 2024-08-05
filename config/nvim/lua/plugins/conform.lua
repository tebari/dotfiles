return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<F3>",
				function()
					require("conform").format({ async = true })
				end,
				mode = { "n", "v" },
				desc = "Format Buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				python = { "isort", "black" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
}
