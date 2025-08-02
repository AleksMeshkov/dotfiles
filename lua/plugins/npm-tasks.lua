return {
  {
    "zyriab/npm-dap.nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("npm-dap").setup()
    end,
  },
}