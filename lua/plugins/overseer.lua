return {
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    opts = {
      templates = { "builtin" },
      strategy = "terminal",
    },
    keys = {
      { "<leader>oo", "<cmd>OverseerRun<cr>", desc = "Run Task" },
      { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    },
  },
}