return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		local refactoring = require("refactoring") -- ts, py, lua, js, c, cPP, go

		refactoring.setup({
			-- prompt_func_return_type = {
			-- 	go = false,
			-- 	java = false,
			--
			-- 	cpp = false,
			-- 	c = false,
			-- 	h = false,
			-- 	hpp = false,
			-- 	cxx = false,
			-- },
			-- prompt_func_param_type = {
			-- 	go = false,
			-- 	java = false,
			-- w
			-- 	cpp = false,
			-- 	c = false,
			-- 	h = false,
			-- 	hpp = false,
			-- 	cxx = false,
			-- },
			-- printf_statements = {},
			-- print_var_statements = {},
			-- show_success_message = false,
		})

		-- set keymaps
		local keymap = vim.keymap

		-- Visual mode
		keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Extract" })
		vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract to file" })
		keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract variable" })

		-- mixed mode
		keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Extract inline variable" })

		-- Normal mode
		keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "Inline function" })
		keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract block" })
		keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Extract block to file" })
	end,
}
