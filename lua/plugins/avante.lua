return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- Auto-detect claude installation or specify path
    terminal_cmd = vim.fn.executable("claude") == 1 and "claude" or "~/.claude/local/claude",
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", function()
        -- Run actual claude --resume command in right panel
        require("snacks").terminal("claude --resume", { 
          win = { position = "right", size = 0.4 }
        })
      end, desc = "Claude --resume" },
    { "<leader>aR", function()
        -- Run actual claude --continue command in right panel
        require("snacks").terminal("claude --continue", { 
          win = { position = "right", size = 0.4 }
        })
      end, desc = "Claude --continue" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
    { "<leader>ae", function()
        -- Send current buffer diagnostics to Claude
        local diagnostics = vim.diagnostic.get(0)
        if #diagnostics == 0 then
          vim.notify("No diagnostics found in current buffer", vim.log.levels.INFO)
          return
        end
        
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local filename = vim.fn.expand("%:p")
        local diagnostic_text = "File: " .. filename .. "\n\nDiagnostics and Errors:\n"
        
        for _, diag in ipairs(diagnostics) do
          local severity = vim.diagnostic.severity[diag.severity]
          local line_num = diag.lnum + 1
          local code_line = lines[diag.lnum] or ""
          diagnostic_text = diagnostic_text .. string.format(
            "\nLine %d (%s): %s\nCode: %s\n", 
            line_num, severity, diag.message, code_line:gsub("^%s+", "")
          )
        end
        
        -- Copy to clipboard and open Claude in right panel
        vim.fn.setreg("+", diagnostic_text)
        vim.notify("Diagnostics copied to clipboard. Opening Claude...", vim.log.levels.INFO)
        require("snacks").terminal("claude", { 
          win = { position = "right", size = 0.4 }
        })
      end, desc = "Send diagnostics to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
  },
}
