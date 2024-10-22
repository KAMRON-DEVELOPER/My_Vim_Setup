-- Lualine has sections as shown below.
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "auto",
				-- theme = "iceberg_dark",
				-- theme = "codedark",
				-- theme = "base16",
				-- theme = "tokyonight",
				-- theme = "gruvbox_dark",
				theme = "dracula",
				-- theme = "ayu_mirage",
				-- theme = "horizon",
				-- theme = "nord",
				-- theme = "onedark",

				-- component_separators = { left = '', right = '' }, -- beetween
				-- section_separators = { left = "", right = "" }, -- inside
				component_separators = { left = "", right = "" }, -- beetween
				section_separators = { left = "", right = "" }, -- inside
			},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
			sections = {
				lualine_a = {
					"mode",
					-- { "mode", separator = { left = "", right = "" }, right_padding = 2 },
				},
				lualine_b = { "branch" },
				lualine_c = {},
				lualine_x = { "diagnostics", "filesize" },
				lualine_y = { "filename" },
				lualine_z = {
					"location",
					-- { "location", separator = { left = "", right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
