---@diagnostic disable: shadowing
return {
	{
		"nvimtools/none-ls.nvim",
		event = "User FileOpened",
		-- event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local mason_null_ls = require "mason-null-ls"
			local null_ls = require "null-ls"

			-- local null_ls_utils = require("null-ls.utils")

			mason_null_ls.setup {
				ensure_installed = {
					"prettier",
					"stylua",
					"black",
					"pylint",
					"biome",
					"selene",
				},
			}

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			-- local code_actions = null_ls.builtins.code_actions
			local config = vim.fn.stdpath "config"

			null_ls.setup {

				sources = {
					formatting.black,
					formatting.biome.with {
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
						},
					},
					formatting.prettier.with {
						filetypes = {
							"css",
							"html",
							"json",
							"yaml",
							"toml",
							"markdown",
							"astro",
						},
					},
					formatting.stylua.with {
						extra_args = { "--config-path", vim.fn.expand(config .. "/stylua.toml") },
					},
					--diagnostics
					require "none-ls.diagnostics.eslint",
					-- require("none-ls-luacheck.diagnostics.luacheck"),
					diagnostics.selene.with {
						extra_args = { "--config", vim.fn.expand(config .. "/selene.toml") },
					},
					diagnostics.pylint.with {
						diagnostics_postprocess = function(diagnostics)
							diagnostics.code = diagnostics.message_id
						end,
					},
				},
			}
		end,
	},
}
