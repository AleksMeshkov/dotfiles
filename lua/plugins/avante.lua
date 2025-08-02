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
        -- Run actual claude --resume command
        require("snacks").terminal("claude --resume", { 
          win = { position = "float" }
        })
      end, desc = "Claude --resume" },
    { "<leader>aR", function()
        -- Run actual claude --continue command  
        require("snacks").terminal("claude --continue", { 
          win = { position = "float" }
        })
      end, desc = "Claude --continue" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
  },
}
