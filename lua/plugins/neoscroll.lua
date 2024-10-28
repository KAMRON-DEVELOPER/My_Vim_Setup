return {
	"karb94/neoscroll.nvim",
	event = "WinScrolled",

	config = function()
		local neoscroll = require("neoscroll")

		neoscroll.setup({
			-- All these keys will be mapped to their corresponding default scrolling animation
			mappings = { "<C-u>", "<C-d>" },
			hide_cursor = true, -- Hide cursor while scrolling
			stop_eof = true, -- Stop at <EOF> when scrolling downwards
			use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing_function = nil, -- Default easing function
			pre_hook = nil, -- Function to run before the scrolling animation starts
			post_hook = nil, -- Function to run after the scrolling animation ends
		})

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 250 })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 250 })
			end,
		}

		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
