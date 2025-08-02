-- Claude Code which-key groups and descriptions
local wk = require("which-key")

-- Register Claude Code group
wk.add({
  { "<leader>a", group = "Claude Code" },
  { "<leader>ac", desc = "Open Claude Code" },
  { "<leader>af", desc = "Focus Claude window" },
  { "<leader>ar", desc = "Claude --resume" },
  { "<leader>aR", desc = "Claude --continue" },
  { "<leader>am", desc = "Select model" },
  { "<leader>as", desc = "Send selection", mode = "v" },
  { "<leader>ae", desc = "Send diagnostics to Claude" },
  { "<leader>aa", desc = "Accept diff" },
  { "<leader>ad", desc = "Reject diff" },
})