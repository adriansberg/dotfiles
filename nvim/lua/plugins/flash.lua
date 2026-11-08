-- Give `s`/`S` back to Vim's substitute; Flash moves to <leader>j / <leader>J.
return {
  "folke/flash.nvim",
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "o", "x" }, false },
    { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
    { "<leader>J", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
