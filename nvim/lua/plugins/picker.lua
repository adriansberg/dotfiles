-- Space Space also lists dotfiles and gitignored files (e.g. .env.local). Alt+h / Alt+i still toggle them off.
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { hidden = true },
      },
    },
  },
}
