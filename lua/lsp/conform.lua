return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black", lsp_format = "fallback" }, -- Conform will run multiple formatters sequentially
				rust = { "rustfmt", lsp_format = "fallback", stop_after_first = true },
				go = { "goimports", "gofmt", "gofumpt", stop_after_first = true, lsp_format = "fallback" }, -- gofmt, gofumpt, goimports
				c = { "clangformat" },
				cpp = { "clangformat" },
				cmake = { "gersemi" },
				javascript = { "prettier", "prettierd", stop_after_first = true }, -- Conform will run the first available formatter
				typescript = { "prettier", "prettierd", stop_after_first = true },
				javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				typescriptreact = { "prettier", "prettierd", stop_after_first = true },
				yaml = { "prettier", "prettierd", stop_after_first = true },
				json = { "prettier", "prettierd", stop_after_first = true },
				html = { "prettier", "prettierd", stop_after_first = true },
				css = { "prettier", "prettierd", stop_after_first = true },
				markdown = { "prettier", "prettierd", stop_after_first = true },
				graphql = { "prettier", "prettierd", stop_after_first = true },
			},

			-- Conform will notify you when a formatter errors
			notify_on_error = true,
			-- Conform will notify you when no formatters are available for the buffer
			notify_no_formatters = true,

			-- auto format on save
			-- format_on_save = {
			-- lsp_fallback = true,
			-- async = false,
			-- timeout_ms = 500,
			-- },
		})

		local conform_format = function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end

		vim.keymap.set({ "n", "v" }, "<leader>mp", conform_format, { desc = "Format file or range (in visual mode)" })
	end,
}
