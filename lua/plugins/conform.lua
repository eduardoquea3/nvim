return {
	"stevearc/conform.nvim",
	keys = { { "<A-s>", function()
		require("conform").format({
			async = false,
			timeout_ms = 500,
			lsp_fallback = true
		})
	end } }
}
