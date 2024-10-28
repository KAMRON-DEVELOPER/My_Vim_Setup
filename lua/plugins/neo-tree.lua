return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      config = function()
        require("window-picker").setup({
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
        })
      end,
    },
  },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Neotree toggle" })
    keymap.set("n", "<C-p>", ":Neotree buffers reveal float<CR>", { desc = "Neotree buffers reveal float" })

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.diagnostic.config({
      signs = {
        error = { text = " ", texthl = "DiagnosticSignError" },
        warn = { text = " ", texthl = "DiagnosticSignWarn" },
        info = { text = " ", texthl = "DiagnosticSignInfo" },
        hint = { text = "󰌵", texthl = "DiagnosticSignHint" },
      },
    })

    -- depricated!!!
    -- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    -- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    -- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    -- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      use_popups_for_input = true,

      source_selector = {
        winbar = false,
        statusline = false,
      },

      file_size = {
        enabled = true,
        required_width = 70,
      },

      type = {
        enabled = true,
        required_width = 70,
      },

      -- default components configs settings
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 0,
        },
        icon = {
          provider = function(icon, node, state)
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "*",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added = "[+]",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },

      -- window settings
      window = {
        position = "left",
        width = 20,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["t"] = { "toggle_node" },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["c"] = "copy",
          ["m"] = "move",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["i"] = "show_file_details",
          ["?"] = "show_help",
        },
      },

      -- filesystem settings
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
        },
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = false,
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["oc"] = { "order_by_created", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          },
          fuzzy_finder_mappings = {
            ["<down>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
          },
        },
      },

      -- buffer settings
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = true,
        show_unloaded = true,
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
            ["."] = "set_root",
            ["oc"] = { "order_by_created", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
            ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
          },
        },
      },
    })
  end,
}
