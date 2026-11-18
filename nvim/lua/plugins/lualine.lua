-- Make unsaved changes visible in the statusline filename: add " ●" and use a highlight
-- every theme colors (LazyVim's default, MatchParen, has no fg in onedark).
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Always show the project root name; LazyVim hides it when root == cwd, the common case.
    opts.sections.lualine_c[1] = LazyVim.lualine.root_dir({ cwd = true })
    for i, c in ipairs(opts.sections.lualine_c) do
      if c[1] == "filetype" then -- the filename component comes right after the filetype icon
        opts.sections.lualine_c[i + 1] = {
          LazyVim.lualine.pretty_path({ modified_hl = "DiagnosticWarn", modified_sign = " ●" }),
        }
      end
    end
  end,
}
