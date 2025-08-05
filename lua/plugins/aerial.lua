return {
  {
    "stevearc/aerial.nvim",
    event = "LspAttach", -- Load when LSP attaches to buffer
    opts = {
      -- Window configuration
      layout = {
        max_width = { 50, 0.3 }, -- Min width 50, max 30% of screen
        width = 40,
        min_width = 30,
        default_direction = "right",
        placement = "window",
        preserve_equality = false,
      },
      
      -- Disable horizontal scrollbar
      manage_folds = false,
      link_folds_to_tree = false,
      link_tree_to_folds = false,
      
      -- Better display options
      show_guides = true,
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },
      
      -- Auto-close when buffer is deleted
      close_on_select = false,
      post_jump_cmd = "normal! zz",
      
      -- Filter configuration
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },
      
      -- Icons
      icons = {},
      
      -- Disable diagnostics in aerial buffer
      attach_mode = "window",
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
      
      -- Keymaps within aerial window
      keymaps = {
        ["?"] = "actions.show_help",
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["p"] = "actions.scroll", 
        ["<C-j>"] = "actions.down_and_scroll",
        ["<C-k>"] = "actions.up_and_scroll",
        ["{"] = "actions.prev",
        ["}"] = "actions.next",
        ["[["] = "actions.prev_up",
        ["]]"] = "actions.next_up",
        ["q"] = "actions.close",
        ["o"] = "actions.tree_toggle",
        ["za"] = "actions.tree_toggle",
        ["O"] = "actions.tree_toggle_recursive",
        ["zA"] = "actions.tree_toggle_recursive",
        ["l"] = "actions.tree_open",
        ["zo"] = "actions.tree_open",
        ["L"] = "actions.tree_open_recursive",
        ["zO"] = "actions.tree_open_recursive",
        ["h"] = "actions.tree_close",
        ["zc"] = "actions.tree_close",
        ["H"] = "actions.tree_close_recursive",
        ["zC"] = "actions.tree_close_recursive",
        ["zr"] = "actions.tree_increase_fold_level",
        ["zR"] = "actions.tree_open_all",
        ["zm"] = "actions.tree_decrease_fold_level",
        ["zM"] = "actions.tree_close_all",
        ["zx"] = "actions.tree_sync_folds",
        ["zX"] = "actions.tree_sync_folds",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
      require("aerial").setup(opts)
      
      -- Auto-resize aerial window when Neovim window is resized
      vim.api.nvim_create_autocmd("VimResized", {
        callback = function()
          local aerial = require("aerial")
          if aerial.is_open() then
            aerial.close()
            vim.defer_fn(function()
              aerial.open()
            end, 10)
          end
        end,
      })
    end,
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
      { "<leader>cS", "<cmd>AerialNavToggle<cr>", desc = "Aerial Navigation" },
    },
    -- Add this to override LazyVim's default trouble symbols mapping
    init = function()
      -- Override LazyVim's trouble symbols keybinding
      vim.keymap.set("n", "<leader>cs", "<cmd>AerialToggle<cr>", { desc = "Aerial (Symbols)" })
    end,
  },
}