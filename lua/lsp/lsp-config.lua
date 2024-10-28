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
					-- "lua-language-server", -- lsp (lua), mason-lspconfig (lua_ls)
					"stylua", -- formatter (lua)

					"pyright", -- lsp (python)
					"mypy", -- linter (python)
					"ruff", -- lsp, linter, formatter (python)
					"isort", -- formatter (python)
					"black", -- formatter (python)
					-- "debugpy", -- An implementation of the Debug Adapter Protocol for Python. from Microsoft

					"rust-analyzer", -- it will be installed via mason-lspconfig (rust_analyzer)
					-- "rustfmt", -- formatter (rust), comes with rust
					-- "codelldb", -- rust debugger

					-- "gopls", -- lsp (go), official go language server (pronounced "Go please")
					"gofumpt", -- formatter (go), a stricter gofmt
					"goimports", -- formatter (go), formats like gofmt and fix imports

					-- "typescript-language-server", -- lsp (javascript and typescript), mason-lspconfig (ts_ls)
					-- "quick-lint-js", -- lsp (javascript and typescript), 130x faster than ESlint
					"prettier", -- formatter (javascript, typescript, json, html, JSX, markdown, yaml)

					-- "clangd", -- lsp (C and C++)
					"clang-format", -- formatter (c, c++)

					"cmake-language-server", -- lsp (cmake), mason-lspconfig (cmake)
					"cmakelint", -- linter (cmake)
					"gersemi", -- formatter (cmake)

					-- "asm-lsp", -- lsp (assembly), mason-lspconfig (asm_lsp)
					-- "asmfmt", -- formatter (assembly)

					-- "dockerfile-language-server", -- lsp (docker), mason-slpconfig (dockerls)
					-- "docker-compose-language-service", -- lsp (docker compose), mason-lspconfig (docker_compose_language_service)

					-- "json-lsp", -- lsp (json), mason-slpconfig (jsonls)

					-- "html-lsp", -- lsp (html)
					-- "templ", -- lsp (html)
					"markuplint", -- linter (html)

					"taplo", -- lsp (toml)

					"marksman", -- lsp (markdown)
					-- "markdownlint", -- linter, formatter (markdown)
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
					"lua_ls",
					"pyright", -- "ruff",
					"rust_analyzer",
					"gopls",
					"ts_ls", -- "quick_lint_js",
					"clangd",
					"cmake",
					"asm_lsp",
					"dockerls",
					"docker_compose_language_service",
					"jsonls",
					"html",
					"templ",
					"taplo",
					"marksman",
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
			local conform = require("conform")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							enable = false,
						},
					},
				},
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.cmake.setup({
				capabilities = capabilities,
			})
			lspconfig.asm_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})

			-- set keymaps
			local keymap = vim.keymap

			local rename_function = function()
				vim.lsp.buf.rename()
			end

			local conform_format = function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP code hovering" })
			keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "LSP code definition" })
			keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "LSP code references" })
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
			vim.keymap.set(
				{ "n", "v" },
				"<C-f>",
				conform_format,
				{ desc = "Conform format file" }
			)
			keymap.set("n", "cf", vim.lsp.buf.format, { desc = "LSP format current buffer" })
			keymap.set("n", "<leader>[d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
			keymap.set("n", "<leader>]d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
			keymap.set("n", "<leader>cR", rename_function, { desc = "LSP rename" })
		end,
	},
}
