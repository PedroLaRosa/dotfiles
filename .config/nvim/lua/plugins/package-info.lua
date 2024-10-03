return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { ";n", group = "npm package", icon = { icon = "", color = "yellow" } },
      },
    },
  },
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("package-info").setup({
        autostart = false,
        package_manager = "npm",
        colors = {
          outdated = "#db4b4b",
        },
        hide_up_to_date = true,
      })
    end,
    keys = {
      {
        ";nt",
        "<cmd>lua require('package-info').toggle()<cr>",
        mode = "n",
        desc = "Toggle",
        silent = true,
        noremap = true,
      },
      {
        ";nd",
        "<cmd>lua require('package-info').delete()<cr>",
        mode = "n",
        desc = "Delete package",
        silent = true,
        noremap = true,
      },
      {
        "n",
        ";nu",
        "<cmd>lua require('package-info').update()<cr>",
        mode = "n",
        desc = "Update package",
        silent = true,
        noremap = true,
      },
      {
        ";ni",
        "<cmd>lua require('package-info').install()<cr>",
        mode = "n",
        silent = true,
        noremap = true,
        desc = "Install package",
      },
      {
        ";nc",
        "<cmd>lua require('package-info').change_version()<cr>",
        mode = "n",
        silent = true,
        noremap = true,
        desc = "Change package version",
      },
    },
  },
}
