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
				-- fmt.prettier.with({
				-- 	filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
				-- }),

				-- diagnostics
				-- dgn.eslint_d,

				-- Code Actions
				-- cda.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
