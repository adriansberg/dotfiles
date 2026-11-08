return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    -- like Cmd+D: add a cursor at the next match of the word/selection
    vim.keymap.set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
    -- like Cmd+Shift+L: cursor on every match of the word/selection
    vim.keymap.set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors, { desc = "Cursors on all matches" })
    mc.addKeymapLayer(function(set)
      set("n", "<Esc>", mc.clearCursors)
    end)
  end,
}
