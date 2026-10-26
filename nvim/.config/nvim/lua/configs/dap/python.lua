local dap = require "dap"

local mason_path = vim.fn.stdpath "data" .. "/mason"

dap.adapters.python = {
  type = "executable",
  command = mason_path .. "/packages/debugpy/venv/bin/python",
  args = {
    "-m",
    "debugpy.adapter",
  },
}

dap.configurations.python = {
  {
    name = "Launch current file",
    type = "python",
    request = "launch",
    program = "${file}",
    pythonPath = function()
      return vim.fn.input("Python executable: ", "python3")
    end,
    console = "integratedTerminal",
  },
  {
    name = "Launch current file (virtualenv)",
    type = "python",
    request = "launch",
    program = "${file}",
    pythonPath = function()
      local venv = os.getenv "VIRTUAL_ENV"

      if venv then
        return venv .. "/bin/python"
      end

      return vim.fn.getcwd() .. "/.venv/bin/python"
    end,
    console = "integratedTerminal",
  },
}
