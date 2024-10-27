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
          -- "lua-language-server", -- it will be installed via mason-lspconfig (lua_ls)
          "stylua",   -- formatter (lua), for none-ls
          "prettier", -- formatter (javascript, typescript, json, html, JSX, markdown, yaml), for none-ls
          -- "pyright", -- it will be installed via mason-lspconfig
          "flake8",   -- python linter
          -- "mypy"
          "mypy",
          "pylint",
          "ruff",
          "black", -- formatter (python), for none-ls
          -- "debugpy", -- An implementation of the Debug Adapter Protocol for Python. from Microsoft
          -- "rust-analyzer", -- it will be installed via mason-lspconfig (rust_analyzer)
          -- "rustfmt", -- formatter (rust)
          -- "codelldb", -- rust debugger
          -- "gopls", -- it will be installed via mason-lspconfig, official go language server (pronounced "Go please")
          "golangci-lint",
          "gofumpt",      -- a stricter gofmt
          "goimports",    -- formatter (go), formats like gofmt and fix imports
          -- "clangd", -- it will be installed via mason-slpconfig
          "clang-format", -- formatter (c, c++), for none-ls
          -- "cpptools", -- Official repository for the Microsoft C/C++ extension for VS Code.
          "cmakelint",    -- cmake linter for nvim-lint
          "gersemi",      -- cmake formatter for none-ls
          -- "typescript-language-server", -- it will installed via mason-lspconfig (ts_ls)
          -- "quick-lint-js", -- it will be installed via mason-lspconfig (quick_lint_js), 130x faster than ESlint
          -- "asm-lsp", -- it will be installed via mason-lspconfig (asm_lsp)
          -- "dockerfile-language-server", -- it will be installed via mason-slpconfig (dockerls)
          -- "docker-compose-language-service", -- it will be installed via mason-lspconfig (docker_compose_language_service)
          -- "json-lsp", -- it will be installed via mason-slpconfig (jsonls)
          "markuplint",   -- html linter for none-ls
          "taplo",        -- it will be installed via mason-lspconfig, linter for toml
          "markdownlint", -- markdown linter for none-ls
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
          "lua_ls",                          -- it can be installed via mason (lua-language-server)
          "pyright",                         -- it can be installed via mason
          "rust_analyzer",                   -- it can be installed via mason (rust-analyzer)
          "gopls",                           -- it can be installed via mason, official go language server (pronounced "Go please")
          "clangd",                          -- it can be installed via mason
          "cmake",                           -- it can be installed via mason (cmake-language-server)
          "asm_lsp",                         -- it can be installed via mason (asm-lsp)
          "ts_ls",                           -- it can be installed via mason (typescript-language-server)
          -- "quick_lint_js",	-- it can be installed via mason (quick-lint-js)
          "dockerls",                        -- it can be installed via mason (dockerfile-language-server)
          "docker_compose_language_service", -- it can be installed via mason (docker-compose-language-service)
          "jsonls",                          -- it can be installed via mason (json-lsp)
          "taplo",                           -- it can be installed via mason, lsp for toml
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
      -- lspconfig.pyright.setup({
      --   capabilities = capabilities,
      -- })
      -- lspconfig.rust_analyzer.setup({
      --   capabilities = capabilities,
      -- })
      -- lspconfig.gopls.setup({
      --   capabilities = capabilities,
      -- })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
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
      lspconfig.asm_lsp.setup({
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

      keymap.set("n", "K", vim.lsp.buf.hover, { desc = "code hovering" })
      keymap.set("n", "cd", vim.lsp.buf.definition, { desc = "code definition" })
      keymap.set("n", "cr", vim.lsp.buf.references, { desc = "code references" })
      keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "code action" })
      keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "format current buffer or range (Visual Mode)" })
      -- keymap.set("n", "cf", vim.lsp.buf.format, { desc = "Format current buffer" })
      -- keymap.set("n", "[d", vim.diagnostic.goto_next(), { desc = "Next Diagnostic" })
      -- keymap.set("n", "]d", vim.diagnostic.goto_prev(), { desc = "Previous Diagnostic" })
      keymap.set("n", "<leader>cR", rename_function, { desc = "LSP rename" })
    end,
  },
}
