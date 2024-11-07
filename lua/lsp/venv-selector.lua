return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },

	config = function()
		local venv_selector = require("venv-selector")

		venv_selector.setup({})
	end,

	opts = {
		settings = {
			options = {
				notify_user_on_venv_activation = true,
			},
		},
	},

	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select virtualEnv" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select cashed virtualEnv" },
	},
}
