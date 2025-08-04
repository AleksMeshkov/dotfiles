-- Debug function to check buffer types
-- Use this in any panel to see its buffer type
local function check_buffer_info()
  local buf = vim.api.nvim_get_current_buf()
  local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
  local buf_name = vim.api.nvim_buf_get_name(buf)
  
  print("Buffer info:")
  print("  buftype: " .. (buftype or "empty"))
  print("  filetype: " .. (filetype or "empty"))
  print("  name: " .. (buf_name or "no name"))
end

-- Create command to run this
vim.api.nvim_create_user_command("CheckBufType", check_buffer_info, {})

return { check_buffer_info = check_buffer_info }