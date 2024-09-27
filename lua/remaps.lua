-- ╔═════════════════════════════════════════════════════╗
-- ║ ██████╗ ███████╗███╗   ███╗ █████╗ ██████╗ ███████╗ ║
-- ║ ██╔══██╗██╔════╝████╗ ████║██╔══██╗██╔══██╗██╔════╝ ║
-- ║ ██████╔╝█████╗  ██╔████╔██║███████║██████╔╝███████╗ ║
-- ║ ██╔══██╗██╔══╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║ ║
-- ║ ██║  ██║███████╗██║ ╚═╝ ██║██║  ██║██║     ███████║ ║
-- ║ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝ ║
-- ╚═════════════════════════════════════════════════════╝
Map = vim.keymap.set

-- ╭──────────╮
-- │ Movement │
-- ╰──────────╯
Map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
Map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ╭─────────────────╮
-- │ File operations │
-- ╰─────────────────╯
Map("n", "<leader>fs", vim.cmd.w, { desc = "Save file" })
Map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit vim" })
Map("n", "<leader>fn", vim.cmd.enew, { desc = "New file" })
Map("n", "<leader>fsq", vim.cmd.wq, { desc = "Save and quit" })
Map("n", "<leader>fss", ":w ", { desc = "Save as" })

-- ╭─────────────────────────────────────────────╮
-- │ Buffer and splits management and navigation │
-- ╰─────────────────────────────────────────────╯
Map("n", "<leader>W", "<CMD>bd!<CR>")
Map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
Map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })
Map("n", "<C-A-w>", "<cmd>bd<cr>", { desc = "Move to next buffer" })

-- ╭──────────────────────────────────────────────────────╮
-- │ Automatically close brackets, parethesis, and quotes │
-- │ Not needed if using autopairs plugin                 │
-- ╰──────────────────────────────────────────────────────╯
-- Map("i", "'", "''<left>")
-- Map("i", '"', '""<left>')
-- Map("i", "(", "()<left>")
-- Map("i", "[", "[]<left>")
-- Map("i", "{", "{}<left>")
-- Map("i", "{;", "{};<left><left>")
-- Map("i", "/*", "/**/<left><left>")

-- ╭────────────────╮
-- │ Open terminals │
-- ╰────────────────╯
Map("t", "<C-A-c>", [[<C-\><C-n>]])
Map("t", "<Esc>", [[<C-\><C-n>]])

Map("n", "<leader>]", function()
	vim.cmd("70vsplit +term")
end, { desc = "Open vertical term" })
Map("n", "<leader>[", function()
	vim.cmd("8split +term")
end, { desc = "Open horizontal term" })
Map("n", "<C-A-g>", function()
	vim.cmd("term lazygit")
end, { desc = "Open a terminal with lazygit" })
Map("n", "<C-A-Space>", function()
	vim.cmd("term")
end, { desc = "Open a full size terminal" })

-- ╭────────────────────────────────╮
-- │ Move between markdown headings │
-- ╰────────────────────────────────╯
Map("n", "gk", function()
	vim.cmd("silent! ?^##\\+\\s.*$")
	vim.cmd("nohlsearch")
end, { desc = "Move to upper heading" })

Map("n", "gj", function()
	vim.cmd("silent! /^##\\+\\s.*$")
	vim.cmd("nohlsearch")
end, { desc = "Move to lower heading" })

-- ╭────────────╮
-- │ Move lines │
-- ╰────────────╯
Map("n", "<C-k>", "<CMD>m .-2<CR>==", { noremap = true })
Map("n", "<C-j>", "<CMD>m .+1<CR>==", { noremap = true })
Map("v", "<C-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
Map("v", "<C-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })

-- ╭─────────────────────╮
-- │ Move in insert mode │
-- ╰─────────────────────╯
Map("i", "<A-k>", "<C-o>a", { noremap = true })
Map("i", "<A-j>", "<C-o>h", { noremap = true })

-- ╭────────────────────────────────────────╮
-- │ Replace all instances of selected word │
-- ╰────────────────────────────────────────╯
Map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', {
	desc = [[Replace all
instances of selected word]],
})
