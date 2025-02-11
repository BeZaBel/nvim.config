local M = {}

-- Helper function to prompt user input with default value
function M.prompt_input(prompt, default)
    local result = vim.fn.input({ prompt = prompt, default = default })
    if result == "" then
        return default
    end
    return result
end

-- Helper function to confirm yes/no questions
function M.confirm(prompt)
    local choice = vim.fn.confirm(prompt, "&Yes\n&No", 2)
    return choice == 1
end

-- Helper function to check if a file exists
function M.file_exists(path)
    local file = io.open(path, "r")
    if file then
        file:close()
        return true
    end
    return false
end

-- Helper function to create the markdown content
function M.create_markdown_content(title, tags, prev, next)
    local lines = {
        "---",
        "tags:",
    }

    -- Add tags if provided
    if tags ~= "" then
        for tag in tags:gmatch("[^%s]+") do
            table.insert(lines, string.format("  - %s", tag))
        end
    else
        table.insert(lines, "  - ")
    end

    -- Add prev section if confirmed
    if prev then
        table.insert(lines, "prev:")
        table.insert(lines, "  - [[]]")
    end

    -- Add next section if confirmed
    if next then
        table.insert(lines, "next:")
        table.insert(lines, "  - [[]]")
    end

    -- Add title
    table.insert(lines, "title:")
    table.insert(lines, string.format('  - "%s"', title))

    table.insert(lines, "---")
    table.insert(lines, "")
    table.insert(lines, "# " .. title)

    return lines
end

return M
