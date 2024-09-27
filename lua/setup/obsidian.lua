return {
    setup = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "notes",
                    path = "~/Documents/notas/",
                },
            },
            ui = {
                enable = false,
                update_debounce = 200,
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    ObsidianTodo = { bold = true, fg = "#fab387" },
                    ObsidianDone = { bold = true, fg = "#89dceb" },
                    ObsidianRightArrow = { bold = true, fg = "#cba6f7" },
                    ObsidianTilde = { bold = true, fg = "#f38ba8" },
                    ObsidianRefText = { underline = true, fg = "#cba6f7" },
                    ObsidianExtLinkIcon = { fg = "#cba6f7" },
                    ObsidianTag = { italic = true, fg = "#89dceb" },
                    ObsidianHighlightText = { bg = "#6c7086" },
                },
            },
            notes_subdir = "general",
            new_notes_location = "notes_subdir",
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
            note_id_func = function(title)
                local prefix = ""
                if title ~= nil then
                    prefix = title
                else
                    prefix = "Untitled Note at " .. tostring(os.time())
                end
                return prefix
            end,
            wiki_link_func = function(opts)
                if opts.id == nil then
                    return string.format("[[%s]]", opts.label)
                elseif opts.label ~= opts.id then
                    return string.format("[[%s|%s]]", opts.id, opts.label)
                else
                    return string.format("[[%s]]", opts.id)
                end
            end,
            -- templates = {
            --     subdir = "moldes",
            --     date_format = "%Y-%m-%d",
            --     time_format = "%H:%M",
            -- },
            sort_by = "modified",
            sort_reversed = true,
            open_notes_in = "current",
            disable_frontmatter = true,
            note_frontmatter_func = function(note)
                if note.title then
                    note:add_alias(note.title)
                end

                local out = {
                    id = note.id,
                    aliases = note.aliases,
                    tags = note.tags,
                }

                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
            attachments = {
                img_folder = "assets",
            },
        })
        local map = vim.keymap.set
        map("n", "<leader>on", ":ObsidianNew ", { desc = [[Create a new note but
         give it a name before]] })
        map("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = [[Rename 
        notes in current buffer]] })
        map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = [[Grep in 
        vault for notes]] })
        map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = [[Show 
        backlinks to note]] })
        map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = [[Open file in Obsidian]] })
    end,
}
