local M = {}

function M.setup()
  require("lspsaga").setup({
    symbol_in_winbar = {
      enable = true,
    },
    outline = {
      close_after_jump = true,
    },
    ui = {
      theme = "round",
      border = "single",
      -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
    lightbulb = {
      enable = false,
    },
  })
end

M.keys = {
  {
    "<leader>sm",
    "<CMD>Lspsaga outline<CR>",
    desc = "Open file outline",
  },
}

return M
