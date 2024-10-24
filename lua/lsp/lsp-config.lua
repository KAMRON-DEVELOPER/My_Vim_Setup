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
					"stylua", -- formatter (lua)
					"black", -- formatter (python)
					"prettier", -- formatter (javascript, typescript, json, html, JSX, markdown, yaml)
					-- "rustfmt", -- formatter (rust)
					-- "lua-language-server", -- it will be installed via mason-lspconfig (lua_ls)
					-- "ruff", -- it will be installed via mason-lspconfig
					-- "rust-analyzer", -- it will be installed via mason-lspconfig (rust_analyzer)
					-- "gopls", -- it will be installed via mason-lspconfig
					-- "clangd", -- it will be installed via mason-slpconfig
					-- "asm-lsp", -- it will be installed via mason-lspconfig (asm_lsp)
					-- "dockerfile-language-server", -- it will be installed via mason-slpconfig (dockerls)
					-- "docker-compose-language-service", -- it will be installed via mason-lspconfig (docker_compose_language_service)
					-- "nginx-language-server", -- it will be installed via mason-lspconfig (nginx_language_serveri)
					-- "jinja-lsp", -- it will be installed via mason-lspconfig (jinja_lsp), django all in one stuff
					-- "eslint-lsp", -- it will be installed via mason-lspconfig (eslint)
					-- "json-lsp", -- it will be installed via mason-slpconfig (jsonls)
					-- "html-lsp", -- it will be installed via mason-lspconfig (html)
					-- "taplo", -- it will be installed via mason-lspconfig
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
					"lua_ls", -- it can be installed via mason (lua-language-server)
					"ruff",
					"rust_analyzer", -- it can be installed via mason (rust-analyzer)
					"gopls", -- it can be installed via mason, official go language server (pronounced "Go please")
					"clangd",
					-- "asm_lsp", -- it can be installed via mason (asm-lsp), assambly language
					"eslint", -- it can be installed via mason (eslint-lsp)
					"dockerls", -- it can be installed via mason (dockerfile-language-server)
					"docker_compose_language_service", -- it can be installed via mason (docker-compose-language-service)
					"nginx_language_server", -- it can be installed via mason (nginx-language-server)
					"jinja_lsp", -- it can be installed via mason (jinja-lsp), django all in one stuff
					"jsonls", -- it can be installed via mason (json-lsp)
					"html", -- it can be installed via mason (html-lsp)
					"taplo", -- it is for toml files
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
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.asm_lsp.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.nginx_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.nginx_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.jinja_lsp.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})

			-- set keymaps
			local keymap = vim.keymap

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hovering" })
			keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "code definition" })
			keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "code references" })
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
		end,
	},
}
