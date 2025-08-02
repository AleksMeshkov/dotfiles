-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp-fix")
require("config.dap-stability")

-- Load Claude keybinding descriptions after which-key is ready
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.which-key-claude")
  end,
})
