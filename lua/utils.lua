-- ╔═══════════════════════════════════════╗
-- ║ ██╗   ██╗████████╗██╗██╗     ███████╗ ║
-- ║ ██║   ██║╚══██╔══╝██║██║     ██╔════╝ ║
-- ║ ██║   ██║   ██║   ██║██║     ███████╗ ║
-- ║ ██║   ██║   ██║   ██║██║     ╚════██║ ║
-- ║ ╚██████╔╝   ██║   ██║███████╗███████║ ║
-- ║  ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝ ║
-- ╚═══════════════════════════════════════╝
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
        Wpt.number = true
        Wpt.relativenumber = true
    end,
})

-- ╭───────────────────────────────────────────────────╮
-- │ Vanilla statuslines, because lualine is for nerds │
-- ╰───────────────────────────────────────────────────╯
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
    vim.cmd([[hi 5TriStatus guibg=#262A33 guifg=#acfa70]])


    Opt.statusline = "%#BaseStatus#"
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
    vim.cmd([[hi 2TriWin guibg=#262A33 guifg=#00cf97]])
    vim.cmd([[hi 3rdWin guibg=#0097a3 guifg=#161616]])
    vim.cmd([[hi 3TriWin guibg=#262A33 guifg=#0097a3]])

    Opt.winbar = "%#1stWin#"
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
