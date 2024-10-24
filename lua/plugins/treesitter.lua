return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			auto_install = true,

			-- enable syntax highlighting
			highlight = { enable = true, additional_vim_regex_highlighting = false },

			-- enable indentation
			indent = { enable = true },

			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },

			ensure_installed = {
				"json",
				"tsx",
				"yaml",
				"xml",
				"toml",
				"html",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"javascript",
				"c",
				"cpp",
				"rust",
				"go",
				"python",
				"pip requirements",
				"regex",
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
		})
	end,
}
