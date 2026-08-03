local dap = require "dap"

local mason_path = vim.fn.stdpath "data" .. "/mason"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

for _, language in ipairs { "c", "cpp" } do
  dap.configurations[language] = {
    {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end
