return {
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true }, -- inlay-hints is causing a lot of errors when writing code in ts, tsx,vuex, go and other when it is true
    },
  },
}
