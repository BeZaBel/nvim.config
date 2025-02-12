local M = {}

function M.setup()
  vim.g.vimtex_view_general_viewer = "zathura"
  vim.g.vimtex_compiler_method = "latexmk"
  vim.g.tex_conceal = "abdmgs"
  vim.g.vimtex_syntax_enabled = 0
  vim.g.vimtex_syntax_conceal_enabled = 0
end

return M
