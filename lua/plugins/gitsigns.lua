return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true, -- Toggle with `:Gitsigns toggle_signs`
				signcolumn = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

				on_attach = function(bufnr)
					--set keymap
					local keymap = vim.keymap

					-- Helper function to map keys
					local function map(mode, lhs, rhs, opts)
						opts = opts or {}
						opts.buffer = bufnr
						keymap.set(mode, lhs, rhs, opts)
					end

					-- Navigation between hunks
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)

					keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns stage_hunk" })
					keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns reset_hunk" })

					-- Visual mode for staging/resetting specific lines
					keymap.set("v", "<leader>gs", function()gitsigns.stage_hunk(vim.fn.line("."), vim.fn.line("v")) end, { desc = "Gitsigns stage selected hunk" })
					keymap.set("v", "<leader>gr", function() gitsigns.reset_hunk(vim.fn.line("."), vim.fn.line("v")) end, { desc = "Gitsigns reset selected hunk" })

					-- Additional Gitsigns key bindings
					keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", { desc = "Gitsigns stage_buffer" })
					keymap.set("n","<leader>gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Gitsigns undo_stage_hunk" })
					keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Gitsigns reset_buffer" })
					keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview_hunk" })
					keymap.set("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, { desc = "Gitsigns blame line with full info" })
					keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns toggle_current_line_blame" })
					keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Gitsigns diffthis" })
					keymap.set("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "Gitsigns show diff with previous commit" })
					keymap.set("n", "<leader>gT", ":Gitsigns toggle_deleted<CR>", { desc = "Gitsigns toggle_deleted" })
				end,
			})
		end,
	},
}
