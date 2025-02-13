local M = {}

-- Helper function to prompt user input with default value
function M.prompt_input(prompt, default)
  local result = vim.fn.input(prompt, default)
  if result == "" then
    return default
  end
  return result
end

-- Helper function to confirm yes/no questions
function M.confirm(prompt)
  local choice = vim.fn.confirm(prompt, "&Yes\n&No")
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

return M
