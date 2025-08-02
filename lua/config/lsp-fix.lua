-- Reduce ESLint and other LSP noise
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = "●",
  },
  float = {
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Filter out specific ESLint errors
local original_handler = vim.lsp.handlers["textDocument/diagnostic"]
vim.lsp.handlers["textDocument/diagnostic"] = function(err, result, ctx, config)
  if err and err.message and err.message:match("Could not find") then
    -- Suppress "Could not find" ESLint errors
    return
  end
  return original_handler(err, result, ctx, config)
end