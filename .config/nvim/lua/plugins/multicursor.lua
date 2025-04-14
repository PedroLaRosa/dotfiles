return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    set({ "n", "x" }, ",k", function()
      mc.lineAddCursor(-1)
    end, { desc = "add cursor above the main cursor" })
    set({ "n", "x" }, ",j", function()
      mc.lineAddCursor(1)
    end, { desc = "add cursor below the main cursor" })
    set({ "n", "x" }, ",K", function()
      mc.lineSkipCursor(-1)
    end, { desc = "skip cursor above the main cursor" })
    set({ "n", "x" }, ",J", function()
      mc.lineSkipCursor(1)
    end, { desc = "skip cursor below the main cursor" })

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, ",n", function()
      mc.matchAddCursor(1)
    end, { desc = "add Next cursor by matching word/selection" })
    set({ "n", "x" }, ",s", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip above cursor selection" })
    set({ "n", "x" }, ",N", function()
      mc.matchAddCursor(-1)
    end, { desc = "add previous cursor by matching word/selection" })
    set({ "n", "x" }, ",S", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip below cursor selection" })

    set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Disable and enable cursors" })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, ",h", mc.prevCursor, { desc = "go previous cursor" })
      layerSet({ "n", "x" }, ",l", mc.nextCursor, { desc = "go next cursor" })

      -- Delete the main cursor.
      layerSet({ "n", "x" }, ",x", mc.deleteCursor, { desc = "delete main cursor" })

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
