return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					-- "lua-language-server", -- lua_ls in mason-lspconfig
					-- "rust_analyzer",
					-- "clangd",
					"stylua", -- lua formatter
					"black", -- python formatter
					-- "isort", -- python formatter
					-- "rustfmt", -- rust formatter
					-- "prettier", -- prettier formatter
					-- "flake8", -- python linter
					-- "eslint_d", -- js linter
					-- "pylint",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,

		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls", -- lua-language-server in mason
					-- "rust_analyzer",
					-- "clangd",
					-- "tsserver",
					-- "eslint",
					-- "pyright",
					-- "html",
					-- "jsonls",

				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		lazy = false,

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.rust_analyzer.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.clangd.setup({
			-- capabilities = capabilities,
			-- })
			-- lspconfig.eslint.setup({
			-- capabilities = capabilities,
			-- })
			-- lspconfig.pyright.setup({
			-- capabilities = capabilities,
			-- })
			-- lspconfig.jsonls.setup({
			-- capabilities = capabilities,
			-- })
			-- lspconfig.html.setup({
			-- capabilities = capabilities,
			-- })

			-- set keymaps
			local keymap = vim.keymap

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hovering" })
			keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "definition" })
			keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "references" })
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
		end,
	},
}
