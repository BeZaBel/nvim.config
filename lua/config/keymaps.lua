-- ┌─────────┐
-- │ Keymaps │
-- └─────────┘

local map = vim.keymap.set

-- ╭──────────╮
-- │ Movement │
-- ╰──────────╯
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("i", "<C-k>", "<right>", { noremap = true })
map("i", "<C-j>", "<left>", { noremap = true })

-- ╭─────────────────╮
-- │ File operations │
-- ╰─────────────────╯
local ff = require("config.file_functions")

map("n", "<leader>fs", vim.cmd.w, { desc = "Save file", noremap = true, silent = true })
map("n", "<leader>fw", vim.cmd.wq, { desc = "Save and quit", noremap = true, silent = true })
map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit vim", noremap = true, silent = true })
map("n", "<leader>ft", vim.cmd.tabnew, { desc = "New file in a tab", noremap = true, silent = true })
map("n", "<leader>fn", vim.cmd.enew, { desc = "New file", noremap = true, silent = true })
map("n", "<leader>fm", ff.new_named_file, { desc = "New named file", noremap = true, silent = true })
map("n", "<leader>fa", ff.save_as, { desc = "Save as", noremap = true, silent = true })
map("n", "<leader>fog", function()
  ff.create_note("./general/")
end, { desc = "New note in general directory", noremap = true, silent = true })
map("n", "<leader>foe", function()
  ff.create_note("./escritos/")
end, { desc = "New note in escritos directory", noremap = true, silent = true })

-- ╭─────────────────────────────────────────────╮
-- │ Buffer and splits management and navigation │
-- ╰─────────────────────────────────────────────╯
map("n", "<leader>W", "<CMD>bd!<CR>", { desc = "Remove current buffer" })
map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })

-- ╭────────────────────╮
-- │ Some misc keybinds │
-- ╰────────────────────╯
map("i", "<C-A-m>", "- [ ] ")
map("n", "<leader>om", "i- [ ] ")
map("n", "<leader>od", function()
  vim.cmd.execute('"normal idate\\<Tab>\\<CR>"')
end, { desc = "Insert date" })

-- ╭──────────────────╮
-- │ Inside terminals │
-- ╰──────────────────╯
map("t", "<C-A-c>", [[<C-\><C-n>]])
map("t", "<Esc>", [[<C-\><C-n>]])

-- ╭────────────╮
-- │ Move lines │
-- ╰────────────╯
map("n", "<C-k>", "<CMD>m-2<CR>", { noremap = true })
map("n", "<C-j>", "<CMD>m+1<CR>", { noremap = true })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })

-- ╭────────────────────────────────────────╮
-- │ Replace all instances of selected word │
-- ╰────────────────────────────────────────╯
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', {
  desc = [[Replace all
instances of selected word]],
})

-- Quickfix actions
map("n", "<leader>cc", "<CMD>cclose<CR>", { desc = "Close Quickfix list" })
