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
    { "<leader>al", function()
        -- Send terminal/log output to Claude
        local buf = vim.api.nvim_get_current_buf()
        local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
        
        if buftype == "terminal" then
          -- Get all terminal content
          local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
          local log_text = "Terminal Output:\n\n" .. table.concat(lines, "\n")
          
          -- Copy to clipboard and open Claude
          vim.fn.setreg("+", log_text)
          vim.notify("Terminal output copied to clipboard. Opening Claude...", vim.log.levels.INFO)
        else
          -- Get visual selection from any buffer
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.api.nvim_buf_get_lines(buf, start_pos[2] - 1, end_pos[2], false)
          
          if #lines > 0 then
            -- Adjust first and last line for partial selection
            if #lines == 1 then
              lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
            else
              lines[1] = string.sub(lines[1], start_pos[3])
              lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
            end
            
            local selection_text = "Selected Output:\n\n" .. table.concat(lines, "\n")
            vim.fn.setreg("+", selection_text)
            vim.notify("Selection copied to clipboard. Opening Claude...", vim.log.levels.INFO)
          else
            vim.notify("No content to send", vim.log.levels.WARN)
            return
          end
        end
        
        -- Focus existing Claude window or open new one
        local claude_win = nil
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local buf_name = vim.api.nvim_buf_get_name(buf)
          if buf_name:match("claude") then
            claude_win = win
            break
          end
        end
        
        if claude_win then
          -- Focus existing Claude window and paste
          vim.api.nvim_set_current_win(claude_win)
          vim.cmd('normal! G') -- Go to end of buffer
          vim.cmd('startinsert!') -- Enter insert mode at end of line
          vim.schedule(function()
            vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
          end)
        else
          -- Open new Claude session
          require("snacks").terminal("claude", { 
            win = { position = "right", size = 0.4 }
          })
        end
      end, desc = "Send logs/selection to Claude", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
  },
}
