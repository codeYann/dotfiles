local function get_project_root()
  local root = vim.fs.root(0, { ".git" })

  if root then
    return root
  end

  local dir = vim.fn.expand "%:p:h"

  if dir == "" then
    dir = vim.fn.getcwd()
  end

  return dir
end

return get_project_root
