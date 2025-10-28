return {
  "jsongerber/nvim-px-to-rem",
  config = true,
  keys = {
    {
      ",cr",
      "<cmd>PxToRemCursor<cr>",
      desc = "Convert px to rem under cursor",
    },
    {
      ",cp",
      "<cmd>PxToRemLine<cr>",
      desc = "Convert px to rem on the whole line, can take a range",
    },
  },
}
