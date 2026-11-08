-- Show HTML comments (<!-- -->) in markdown instead of hiding them when the cursor is elsewhere.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = { html = { comment = { conceal = false } } },
}
