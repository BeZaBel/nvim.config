-- ╔════════════════════════════════════════════════════╗
-- ║ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ║
-- ║ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ║
-- ║ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ║
-- ║ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ║
-- ║ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ║
-- ║ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ║
-- ╚════════════════════════════════════════════════════╝
-- ╭──────────────────────────────────────╮
-- │ Basic settings, remaps and utilities │
-- ╰──────────────────────────────────────╯
local gpt = vim.g
local opt = vim.o
local wpt = vim.wo
local map = vim.keymap.set

gpt.mapleader = " "
gpt.maplocalleader = " "
opt.background = "dark"
opt.colorcolumn = "80"
opt.path = "**"
opt.syntax = "ON"
opt.backup = false
opt.compatible = false
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.cursorline = true
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.formatoptions = "t"
opt.foldmethod = "manual"
opt.incsearch = true
opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.fileencoding = "utf-8"
opt.pumheight = 12
opt.laststatus = 3
opt.showcmd = true
opt.expandtab = true
opt.smartindent = true
opt.showmode = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.completeopt = "menuone,noselect"
opt.timeout = true
opt.timeoutlen = 300
opt.linebreak = true
wpt.signcolumn = "yes"
wpt.fillchars = "eob: ,vert:│"

-- ╭────────────────────────────────────╮
-- │ Netrw (Disabled if using oil.nvim) │
-- ╰────────────────────────────────────╯
gpt.netrw_banner = 0
gpt.netrw_bufsettings = "noma,nomod,nu,nowrap,ro,nobl"
gpt.netrw_browse_split = 0
gpt.netrw_liststyle = 3
gpt.netrw_altv = 1

-- ╭──────────────────────────────╮
-- │ Gui configurations (neovide) │
-- ╰──────────────────────────────╯
opt.guifont = "Iosevka Nerd Font Mono:h12"
gpt.neovide_padding_top = 10
gpt.neovide_padding_left = 10
gpt.neovide_padding_right = 10
gpt.neovide_padding_bottom = 10
gpt.neovide_position_animation_length = 0.05
gpt.neovide_scroll_animation_length = 0.05
gpt.neovide_cursor_animation_length = 0.05

-- ╭──────────╮
-- │ Movement │
-- ╰──────────╯
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ╭─────────────────╮
-- │ File operations │
-- ╰─────────────────╯
map("n", "<leader>fs", vim.cmd.w, { desc = "Save file" })
map("n", "<leader>fq", vim.cmd.quit, { desc = "Exit vim" })
map("n", "<leader>fn", vim.cmd.enew, { desc = "New file" })
map("n", "<leader>fsq", vim.cmd.wq, { desc = "Save and quit" })
map("n", "<leader>fss", ":w ", { desc = "Save as" })

-- ╭─────────────────────────────────────────────╮
-- │ Buffer and splits management and navigation │
-- ╰─────────────────────────────────────────────╯
map("n", "<leader>W", "<CMD>bd!<CR>")
map("n", "<C-A-k>", "<cmd>bprev<cr>", { desc = "Move to previous buffer" })
map("n", "<C-A-j>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })
map("n", "<C-A-w>", "<cmd>bd<cr>", { desc = "Move to next buffer" })

-- ╭──────────────────────────────────────────────────────╮
-- │ Automatically close brackets, parethesis, and quotes │
-- │ Not needed if using autopairs plugin                 │
-- ╰──────────────────────────────────────────────────────╯
map("i", "'", "''<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")

-- ╭────────────────╮
-- │ Open terminals │
-- ╰────────────────╯
map("t", "<C-A-c>", [[<C-\><C-n>]])
map("t", "<Esc>", [[<C-\><C-n>]])

map("n", "<leader>]", function()
    vim.cmd("70vsplit +term")
end, { desc = "Open vertical term" })
map("n", "<leader>[", function()
    vim.cmd("8split +term")
end, { desc = "Open horizontal term" })
map("n", "<C-A-g>", function()
    vim.cmd("term lazygit")
end, { desc = "Open a terminal with lazygit" })
map("n", "<C-A-Space>", function()
    vim.cmd("term")
end, { desc = "Open a full size terminal" })

-- ╭────────────────────────────────╮
-- │ Move between markdown headings │
-- ╰────────────────────────────────╯
map("n", "gk", function()
    vim.cmd("silent! ?^##\\+\\s.*$")
    vim.cmd("nohlsearch")
end, { desc = "Move to upper heading" })

map("n", "gj", function()
    vim.cmd("silent! /^##\\+\\s.*$")
    vim.cmd("nohlsearch")
end, { desc = "Move to lower heading" })

-- ╭────────────╮
-- │ Move lines │
-- ╰────────────╯
map("n", "<C-k>", "<CMD>m .-2<CR>==", { noremap = true })
map("n", "<C-j>", "<CMD>m .+1<CR>==", { noremap = true })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })

-- ╭─────────────────────╮
-- │ Move in insert mode │
-- ╰─────────────────────╯
map("i", "<A-k>", "<C-o>a", { noremap = true })
map("i", "<A-j>", "<C-o>h", { noremap = true })

-- ╭────────────────────────────────────────╮
-- │ Replace all instances of selected word │
-- ╰────────────────────────────────────────╯
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', {
    desc = [[Replace all
instances of selected word]],
})

-- Open netrw
map("n", "<leader><C-l>", "<CMD>15Lex<CR>")

-- ╭───────────────────╮
-- │ Highlight on yank │
-- ╰───────────────────╯
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- ╭────────────────────────╮
-- │ Numbers on help buffer │
-- ╰────────────────────────╯
local helpnums = vim.api.nvim_create_augroup("HelpNums", { clear = true })
vim.api.nvim_create_autocmd("filetype", {
    group = helpnums,
    pattern = "help",
    callback = function()
        wpt.number = true
        wpt.relativenumber = true
    end,
})

-- ╭──────────────────────────────────────────────────╮
-- │ Vanilla statusline, because lualine is for nerds │
-- ╰──────────────────────────────────────────────────╯
local function set_status()
    local function gitbranch()
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        if string.len(branch) > 0 then
            return " 󰊢  " .. branch
        else
            return " "
        end
    end

    vim.cmd([[hi BaseStatus guibg=#292f56 guifg=#ffffff]])
    vim.cmd([[hi 1TriStatus guibg=#006290 guifg=#292f56]])
    vim.cmd([[hi 2ndStatus guibg=#006290 guifg=#ffffff]])
    vim.cmd([[hi 2TriStatus guibg=#0097a3 guifg=#006290]])
    vim.cmd([[hi 3rdStatus guibg=#0097a3 guifg=#161616]])
    vim.cmd([[hi 3TriStatus guibg=#00cf97 guifg=#0097a3]])
    vim.cmd([[hi 4thStatus guibg=#00cf97 guifg=#161616]])
    vim.cmd([[hi 4TriStatus guibg=#acfa70 guifg=#00cf97]])
    vim.cmd([[hi 5thStatus guibg=#acfa70 guifg=#161616]])
    vim.cmd([[hi 5TriStatus guibg=#262833 guifg=#acfa70]])

    opt.statusline = "%#BaseStatus#"
        .. " ☭ "
        .. gitbranch()
        .. " %*"
        .. "%#1TriStatus#"
        .. " "
        .. "%#2ndStatus#"
        .. "%y"
        .. " %F "
        .. "%#2TriStatus#"
        .. ""
        .. "%#3rdStatus#"
        .. " Row: %l/%L "
        .. "%#3TriStatus#"
        .. ""
        .. "%#4thStatus#"
        .. " Col: %v "
        .. "%#4TriStatus#"
        .. ""
        .. "%#5thStatus#"
        .. " %p%% "
        .. "%#5TriStatus#"
        .. ""
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("BufStatusLine", {}),
    callback = set_status,
})
-- ╭───────────────────╮
-- │ Winbar formatting │
-- ╰───────────────────╯
local set_winbar = function()
    vim.cmd([[hi 1stWin guibg=#acfa70 guifg=#161616]])
    vim.cmd([[hi 1TriWin guibg=#00cf97 guifg=#acfa70]])
    vim.cmd([[hi 2ndWin guibg=#00cf97 guifg=#161616]])
    vim.cmd([[hi 2TriWin guibg=#262833 guifg=#00cf97]])

    opt.winbar = "%#1stWin#"
        .. "  %n: "
        .. "%#1TriWin#"
        .. ""
        .. "%#2ndWin#"
        .. " %t %m "
        .. "%#2TriWin#"
        .. ""
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("BufWinbar", {}),
    callback = set_winbar,
})

-- ╭──────────────╮
-- │ Lazy plugins │
-- ╰──────────────╯
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        import = "plugs.base",
    },
    {
        import = "plugs.lsp",
    },
    {
        import = "plugs.ui",
    },
    {
        import = "plugs.utils",
    },
}, {
    change_detection = {
        notify = false,
    },
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
