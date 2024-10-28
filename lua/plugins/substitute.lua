return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local substitute = require("substitute")

		substitute.setup()

		local keymap = vim.keymap

		keymap.set("n", "sx", substitute.operator, { noremap = true, desc = "Substitute with motion" })
		keymap.set("n", "sxs", substitute.line, { noremap = true, desc = "Substitute line" })
		keymap.set("n", "sxS", substitute.eol, { noremap = true, desc = "Substitute to end of line" })
		keymap.set("x", "S", substitute.visual, { noremap = true, desc = "Substitute in visual mode" })
	end,
}
