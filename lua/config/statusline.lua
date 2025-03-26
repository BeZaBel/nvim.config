-- ╭────────────────────╮
-- │ Vanilla statusline │
-- ╰────────────────────╯

-- Set custom highlight groups
vim.api.nvim_set_hl(0, "StatusBuffer", { fg = "#eff1f5", bg = "#7287fd" })
vim.api.nvim_set_hl(0, "StatusPath", { fg = "#eff1f5", bg = "#4c4f69" })
vim.api.nvim_set_hl(0, "StatusLineInfo", { fg = "#4c4f69", bg = "#eff1f5" })
vim.api.nvim_set_hl(0, "StatusSep1", { fg = "#7287fd", bg = "#4c4f69" })
vim.api.nvim_set_hl(0, "StatusSep2", { fg = "#4c4f69", bg = "#eff1f5" })

local function set_status()
  local parts = {
    "%#StatusBuffer#",
    "  : %t %m",
    "%#StatusSep1#", -- Separator
    "%=",
    "%#StatusPath#",
    " : %-.50F ",
    "%#StatusSep2#", -- Separator
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
