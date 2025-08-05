return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
        },
        smart = {
          hidden = true,
        },
      },
    },
    project = {
      enabled = true,
      projects = {
        "~/Devel/my.slateaudio.com",
        "~/.config/nvim",
      },
    },
  },
}