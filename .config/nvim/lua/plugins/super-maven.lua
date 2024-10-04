return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-J>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        disable_inline_completion = true, -- disables inline completion for use with cmp
      })
      -- Setup for nvim-cmp (completion)
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "supermaven" },
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          -- Control + Space to accept the top suggestion
          ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
    keys = {
      { "<leader>tt", "<cmd>SupermavenToggle<cr>", desc = "Supermaven: Toggle" },
      { "<leader>ts", "<cmd>SupermavenStart<cr>", desc = "Supermaven: Start" },
      { "<leader>tp", "<cmd>SupermavenStop<cr>", desc = "Supermaven: Stop" },
      { "<leader>tr", "<cmd>SupermavenRestart<cr>", desc = "Supermaven: Restart" },
      { "<leader>tT", "<cmd>SupermavenStatus<cr>", desc = "Supermaven: Status" },
      { "<leader>tf", "<cmd>SupermavenUseFree<cr>", desc = "Supermaven: Use Free Version" },
      { "<leader>tP", "<cmd>SupermavenUsePro<cr>", desc = "Supermaven: Use Pro Version" },
      { "<leader>tl", "<cmd>SupermavenLogout<cr>", desc = "Supermaven: Logout" },
      { "<leader>tS", "<cmd>SupermavenShowLog<cr>", desc = "Supermaven: Show Log" },
      { "<leader>tc", "<cmd>SupermavenClearLog<cr>", desc = "Supermaven: Clear Log" },
    },
  },
}
