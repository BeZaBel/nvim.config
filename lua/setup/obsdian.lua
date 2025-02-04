local s = {}

s.setup = function()
    require("obsidian").setup({
        workspaces = {
            {
                name = "notas",
                path = "~/notas",
            },
        },
        ui = {
            enable = false,
            update_debounce = 200,
        },
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
        sort_by = "modified",
        sort_reverserd = true,
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
        picker = {
            name = "telescope.nvim",
            -- Optional, configure key mappings for the picker. These are the defaults.
            -- Not all pickers support all mappings.
            note_mappings = {
                -- Create a new note from your query.
                new = "<C-x>",
                -- Insert a link to the selected note.
                insert_link = "<C-l>",
            },
            tag_mappings = {
                -- Add tag(s) to current note.
                tag_note = "<C-x>",
                -- Insert a tag at the current location.
                insert_tag = "<C-l>",
            },
        },
    })
end

-- [[
-- local map = vim.keymap.set
-- map("n", "<leader>on", ":ObsidianNew ", { desc = [[Create a new note but give it a name before]]})
-- map("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = [[Rename notes in current buffer]] })
-- map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = [[Grep in vault for notes]] })
-- map("n", "<leader>ob", "<cmd>ObsidianBackLinks<cr>", { desc = [[Show backlinks to note]] })
-- map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = [[Open file in Obsidian]] })
-- ]]

return s
