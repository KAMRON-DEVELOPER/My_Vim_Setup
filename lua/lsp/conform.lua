return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "gofmt", lsp_format = "fallback" }, -- gofmt, gofumpt, goimports
        cpp = { "clangformat" },
        cmake = { "gersemi" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
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
        timeout_ms = 500,
      })
    end

    vim.keymap.set({ "n", "v" }, "<leader>mp", conform_format, { desc = "Format file or range (in visual mode)" })
  end,
}
