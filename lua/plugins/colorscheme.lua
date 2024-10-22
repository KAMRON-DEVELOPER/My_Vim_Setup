return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "cool", -- "dark", "darker", "cool", "deep", "warm", "warmer"
		})
		vim.cmd("colorscheme onedark")
	end,
}

-- return {
--     {
--       "catppuccin/nvim",
--       lazy = false,
--       name = "catppuccin",
--       priority = 1000,
--       config = function()
--         vim.cmd("colorscheme catppuccin-frappe") -- latte, frappe, macchiato, mocha
--       end
--     }
--   }

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--     vim.cmd("colorscheme tokyonight-storm") -- moon, storm, night, day
--     end,
-- }
