local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Copy relative path (src/foo.txt)
keymap.set("n", ";yp", ':let @*=expand("%")<Return>', { desc = "Copy current file relative path to clipboard" })
-- Copy absolute path (/something/src/foo.txt)
keymap.set("n", ";yP", ':let @*=expand("%:p")<Return>', { desc = "Copy current absolute path to clipboard" })
-- Copy filename (foo.txt)
keymap.set("n", ";yd", ':let @*=expand("%:t")<Return>', { desc = "Copy current file name to clipboard" })
-- Copy directory name (/something/src)
keymap.set("n", ";yD", ':let @*=expand("%:p:h")<Return>', { desc = "Copy current directory name to clipboard" })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<leader>w", ":update<Return>", opts)
keymap.set("n", "<leader>q", ":quit<Return>", opts)
keymap.set("n", "<leader>Q", ":qa<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
