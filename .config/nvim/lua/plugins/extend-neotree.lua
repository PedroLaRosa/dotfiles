return {
  "nvim-neo-tree/neo-tree.nvim",

  init = function()
    vim.g.neotree = {
      auto_close = true,
      auto_open = true,
      auto_update = true,
      update_to_buf_dir = true,
    }
  end,

  -- Deactivate the default mappings
  -- to set mini.files as default filetree
  keys = {
    {
      "<leader>e",
      false,
    },
    {
      "<leader>E",
      false,
    },
  },

  opts = {
    close_if_last_window = true,
    window = { position = "right" },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    hijack_netrw_behavior = "disabled",
  },
}
