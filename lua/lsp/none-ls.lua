return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			sources = {
				formatting.stylua,    -- lua
				formatting.black,     -- python
				formatting.goimports, -- go
				formatting.prettier,  -- html, json, yaml, markdown, javascript, typescript, svelte, javascriptreact, typescriptreact, vue, css
				formatting.clang_format, -- c, cpp, cs, java, cuda, proto
				formatting.gersemi,   -- cmake
				formatting.asmfmt,    -- asm

				diagnostics.cmake_lint, -- cmake
				diagnostics.markdownlint, -- markdown
				diagnostics.markuplint, -- html

				code_actions.refactoring, -- go, javascript, lua, python, typescript
				code_actions.gitsigns,
			},
		})

		vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "format current buffer or range (Visual Mode)" })
	end,
}
