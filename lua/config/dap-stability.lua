-- Minimal DAP stability - remove all complex autocmds that might cause conflicts
local group = vim.api.nvim_create_augroup("DapStability", { clear = true })

-- ONLY essential DAP window settings
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches", "dapui_repl" },
  callback = function()
    -- Minimal settings - just prevent resizing
    vim.wo.winfixwidth = true
    vim.wo.winfixheight = true
  end,
})