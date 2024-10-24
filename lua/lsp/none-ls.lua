return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local fmt = null_ls.builtins.formatting
		local dgn = null_ls.builtins.diagnostics
		local cda = null_ls.builtins.code_actions

		null_ls.setup({
			sources = {
				-- formatting
				fmt.stylua,
				fmt.black,
				-- fmt.rustfmt,
				fmt.prettier.with({
					filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
				}),
				fmt.clang_format,
				fmt.goimports,

				-- diagnostics
				-- dgn.eslint,

				-- Code Actions
				-- cda.eslint,
			},
		})

		vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "format current buffer or range (Visual Mode)" })
	end,
}
