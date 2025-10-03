return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
██████╗ ███████╗██████╗ ██████╗  ██████╗ 
██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗
██████╔╝█████╗  ██║  ██║██████╔╝██║   ██║
██╔═══╝ ██╔══╝  ██║  ██║██╔══██╗██║   ██║
██║     ███████╗██████╔╝██║  ██║╚██████╔╝
╚═╝     ╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ]],
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "curl https://wttr.in/",
          height = 8,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "gh notify -s -an 5",
              action = function()
                vim.ui.open("https://github.com/notifications")
              end,
              key = "n",
              icon = " ",
              height = 10,
              enabled = true,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 5",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
      -- sections = {
      --   { section = "header" },
      --   {
      --     pane = 2,
      --     section = "terminal",
      --     cmd = "curl https://wttr.in/",
      --     height = 8,
      --     padding = 1,
      --   },
      --   { section = "keys", gap = 1, padding = 1 },
      --   { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      --   -- { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      --   {
      --     pane = 2,
      --     icon = " ",
      --     title = "Git Status",
      --     section = "terminal",
      --     enabled = function()
      --       return Snacks.git.get_root() ~= nil
      --     end,
      --     cmd = "hub status --short --branch --renames",
      --     height = 5,
      --     padding = 1,
      --     ttl = 5 * 60,
      --     indent = 3,
      --   },
      --   { section = "startup" },
      -- },
    },
  },
}
