local M = {}

function M.setup()
  require("iron.core").setup({
    config = {
      scratch_repl = true,
      repl_definition = {
        lua = {
          command = { "lua" },
        },
        scm = {
          command = { "chez" },
        },
        r = {
          command = { "radian" },
        },
        python = {
          -- command = { "python3" },
          command = { "ptpython" },
        },
      },
      -- repl_open_cmd = require("iron.view").bottom(10),
      repl_open_cmd = "20 split",
    },
    keymaps = {
      send_motion = "<leader>rc",
      visual_send = "<leader>rc",
      send_file = "<leader>rf",
      send_line = "<leader>rl",
      send_mark = "<leader>rm",
      mark_motion = "<leader>rmc",
      mark_visual = "<leader>rmc",
      remove_mark = "<leader>rmd",
      cr = "<leader>r<cr>",
      interrupt = "<leader>r<leader>",
      exit = "<leader>rq",
      clear = "<leader>rx",
    },
    highlight = {
      italic = true,
    },
    ignore_blank_lines = true,
  })
end

M.keys = {
  {
    "<leader>is",
    "<cmd>IronRepl<cr>",
    desc = "Start IRON REPL",
  },
  {
    "<leader>ir",
    "<cmd>IronRestart<cr>",
    desc = "Restart IRON REPL",
  },
  {
    "<leader>iF",
    "<cmd>IronFocus<cr>",
    desc = "Focus REPL",
  },
  {
    "<leader>ih",
    "<cmd>IronHide<cr>",
    desc = "Hide REPL",
  },
}

return M
