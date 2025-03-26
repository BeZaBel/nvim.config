local M = {}

function M.setup()
  local quarto = require("quarto")
  quarto.setup({
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "r", "html" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "iron",
      never_run = { "yaml" },
    },
  })

  local runner = require("quarto.runner")
  local map = vim.keymap.set
  map("n", "<localleader>qp", quarto.quartoPreview, { desc = "Start quarto preview", silent = true, noremap = true })
  map("n", "<localleader>bc", runner.run_cell, { desc = "Run cell", silent = true })
  map("n", "<localleader>ba", runner.run_above, { desc = "run cell and above", silent = true })
  map("n", "<localleader>bA", runner.run_all, { desc = "run all cells", silent = true })
  map("n", "<localleader>bl", runner.run_line, { desc = "run line", silent = true })
  map("v", "<localleader>b", runner.run_range, { desc = "run visual range", silent = true })
  map("n", "<localleader>BA", function()
    runner.run_all(true)
  end, { desc = "Run all cells opf all languages", silent = true })
end

return M
