return {
  "pittcat/claude-fzf.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
    "coder/claudecode.nvim",
  },
  opts = {
    auto_context = true,
    batch_size = 10,
  },
  cmd = {
    "ClaudeFzf",
    "ClaudeFzfFiles",
    "ClaudeFzfGrep",
    "ClaudeFzfBuffers",
    "ClaudeFzfGitFiles",
    "ClaudeFzfDirectory",
  },
  keys = {
    { "<leader>aF", "<cmd>ClaudeFzfFiles<cr>", desc = "Claude: Add files" },
    { "<leader>aS", "<cmd>ClaudeFzfGrep<cr>", desc = "Claude: Search and add" },
    { "<leader>aB", "<cmd>ClaudeFzfBuffers<cr>", desc = "Claude: Add buffers" },
    { "<leader>ag", "<cmd>ClaudeFzfGitFiles<cr>", desc = "Claude: Add Git files" },
    { "<leader>ad", "<cmd>ClaudeFzfDirectory<cr>", desc = "Claude: Add directory files" },
  },
}
