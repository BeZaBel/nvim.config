local M = {}

function M.setup()
  local opts = {
    user_maps_only = true,
    disable_cmds = {
      "RSend",
      "RClearConsole",
      "RCustomStart",
      "RSPlot",
      "RSaveClose",
    },
  }
  require("r").setup(opts)
end

return M
