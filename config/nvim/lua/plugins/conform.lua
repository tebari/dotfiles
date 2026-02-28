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
				css = { "prettierd", "prettier", stop_after_first = true },
				python = { "isort", "black" },
				java = { "google-java-format" },
				kotlin = { "ktlint" },
				rust = { "rustfmt" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
			json = { "prettierd", "prettier", stop_after_first = true },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
}
