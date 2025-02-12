-- ╭────────────────────╮
-- │ Vanilla statusline │
-- ╰────────────────────╯

-- Set custom highlight groups
vim.api.nvim_set_hl(0, "StatusBuffer", { fg = "#ffffff", bg = "#2D4F67" })
vim.api.nvim_set_hl(0, "StatusPath", { fg = "#ffffff", bg = "#16161D" })
vim.api.nvim_set_hl(0, "StatusLineInfo", { fg = "#000000", bg = "#98BB6C" })
vim.api.nvim_set_hl(0, "StatusSep1", { fg = "#2D4F67", bg = "#16161D" })
vim.api.nvim_set_hl(0, "StatusSep2", { fg = "#16161D", bg = "#98BB6C" })

local function set_status()
  local parts = {
    "%#StatusBuffer#",
    "  : %t %m",
    "%#StatusSep1#", -- Separator
    "%=",
    "%#StatusPath#",
    " : %-.50F ",
    "%#StatusSep2#", -- Separator
    -- "| ",
    "%#StatusLineInfo#",
    " 󰠷 : %l/%L ",
    "󰠵: %v ",
    "| ",
    "󰠞 : %p%% ",
    "%*", -- Reset formatting
  }
  return table.concat(parts, "")
end

vim.o.statusline = set_status()
