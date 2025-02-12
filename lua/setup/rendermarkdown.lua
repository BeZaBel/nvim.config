local M = {}

function M.setup()
  require("render-markdown").setup({
    -- enable = true,
    render_modes = { "n", "v", "i", "c", "t" },
  })
end

return M
