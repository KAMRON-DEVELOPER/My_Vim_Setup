return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            -- enable syntax highlighting
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = { enable = true },
            auto_install = true,
            ensure_installed = {
                "json",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "javascript",
                "typescript",
                "c",
                "cpp",
                "make",
                "cuda",
                "rust",
                "go",
                "python",
                "dart",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "<C-Space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = false,
                max_file_lines = nil,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })
    end,
}
