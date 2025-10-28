return {
  {
    "pwntester/octo.nvim",
    keys = {
      -- Global keymaps
      { "<leader>gop", "<cmd>Octo pr list<CR>", desc = "List PRs" },
      { "<leader>goP", "<cmd>Octo pr search<CR>", desc = "Search PRs" },
      { "<leader>goc", "<cmd>Octo pr create<CR>", desc = "Create PR from current branch" },
      { "<leader>god", "<cmd>Octo pr draft<CR>", desc = "Move a ready PR to draft" },
      { "<leader>god", "<cmd>Octo pr draft<CR>", desc = "Move a ready PR to draft" },
      { "<leader>gou", "<cmd>Octo pr url<CR>", desc = "Copy the URL of current PR to clipboard" },
      { "<leader>gob", "<cmd>Octo pr browser<CR>", desc = "Open current PR in the browser" },

      -- Custom team PR search functionality
      {
        "<leader>gt",
        function()
          local members = { "team_member1", "team_member2", "team_member3" }
          local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))

          require("telescope.pickers")
            .new({}, {
              prompt_title = "Team Members",
              finder = require("telescope.finders").new_table({
                results = members,
              }),
              sorter = require("telescope.config").values.generic_sorter({}),
              attach_mappings = function(prompt_bufnr, map)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  vim.cmd("Octo search author:" .. selection[1] .. " is:pr is:open created:>=" .. last_two_months)
                end)
                return true
              end,
            })
            :find()
        end,
        desc = "Team Open PRs (Octo)",
      },

      -- PRs to review
      {
        "<leader>gR",
        function()
          local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))
          vim.cmd("Octo search user-review-requested:@me is:pr is:open created:>=" .. last_two_months)
        end,
        desc = "PRs to Review (Octo)",
      },
    },
    config = function(_, opts)
      -- Register markdown for octo filetype for treesitter
      vim.treesitter.language.register("markdown", "octo")

      -- Setup octo.nvim with the provided options
      require("octo").setup(opts)
    end,
  },
}
