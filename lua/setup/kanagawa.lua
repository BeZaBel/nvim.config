local M = {}

function M.setup(active)
  require("kanagawa").setup({
    compile = true,
    transparent = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,
    statementStyle = { bold = true },
    typeStyle = {},
    -- wave, dragon, lotus
    theme = "dragon", -- Load "wave" theme when 'background' option is not set
    background = { -- map the value of 'background' option to a theme
      dark = "wave", -- try "dragon" !
      light = "lotus",
    },
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors)
      local theme = colors.theme
      return {
        -- CursorLineNr = { bg = theme.ui.bg_p2, bold = true },
        -- NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
        TelescopeTitle = { fg = theme.ui.special, bold = true },
        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      }
    end,
  })

  if active then
    vim.cmd.colorscheme("kanagawa")
  end
end

return M
