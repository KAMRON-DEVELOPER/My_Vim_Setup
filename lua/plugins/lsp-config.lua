return {
	{
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end
	}
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- "html", -- htlm
				-- "tailwindcss", -- tailwindcss
				-- "svelte", -- stelve
				-- "emmet_ls", -- emmet
				-- "asm_lsp", -- assembly
				"lua_ls", -- lua
				-- "cmake", -- cmake
				"clangd", -- c and c++
				"rust_analyzer", -- rust_analyzer, other options: rust_analyzer, ast_grep, harper_ls
				-- "pyright", -- python, other options: pyright, pylsp, ruff, ast_grep, jedi_language_server
				-- "jinja_lsp", -- django
				-- "docker_compose_language_service", -- docker and compose
				-- "dockerls", -- docker
				-- "ast_grep", -- go, python, rust, typeScript, javascript, JSX, c#, c++, c, css, dart, kotlin, lua, html, java other options: ast_grep, golangci_lint_ls, gopls, harper_ls
				-- "eslint", -- javascript, typescript
				-- "jsonls", -- json, other options: jsonls, biome, jsonnet_ls, rome, spectral
				-- "harper_ls", -- TOML, lua, markdown, c++, c, go, javascript, typeScript python, ruby, rust,  other options: harper_ls, taplo
				-- "nginx_language_server", -- nginx
				-- "opencl_ls", -- openCL
				-- "glsl_analyzer", -- openGL
				-- "yamlls", -- YAML, other options: yamlls, spectral, hydra_lsp
				-- "zls", -- zig
			},
		})
		end
	}
}
