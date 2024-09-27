return {
	{
		"nvim-treesitter/nvim-treesitter",
		ft = "toml",
		opts = {
			ensure_installed = {
				"toml",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		ft = "python",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"zapling/mason-conform.nvim",
				opts = {
					ensure_installed = { "taplo" },
				},
			},
		},
		opts = {
			formatters_by_ft = {
				toml = { "taplo" }
			},
		},
	},
}
