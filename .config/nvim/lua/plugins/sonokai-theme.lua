return {
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "default" -- Options: "andromeda", "atlantis", "shusia", "maia", "Espresso", default"
      vim.cmd.colorscheme("sonokai")
    end,
  },
}
