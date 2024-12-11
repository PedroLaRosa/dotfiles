return {
  "crnvl96/lazydocker.nvim",
  event = "VeryLazy",
  opts = {}, -- automatically calls `require("lazydocker").setup()`
  keys = {
    {
      ";d",
      ":LazyDocker<Return>",
      desc = "Open LazyDocker",
      silent = true,
      noremap = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
