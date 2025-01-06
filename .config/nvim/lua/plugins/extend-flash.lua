return {
  -- Remove behavior for ; and , keys to assign them to telescope
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        keys = { "f", "F", "t", "T" },
      },
    },
  },
}
