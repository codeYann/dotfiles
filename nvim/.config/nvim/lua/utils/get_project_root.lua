local function get_project_root()
  return vim.fs.root(0, { ".git" }) or vim.fn.expand "%:p:h"
end

return get_project_root
