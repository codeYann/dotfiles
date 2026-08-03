local dap = require "dap"

dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug File",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug Package",
    request = "launch",
    program = "${workspaceFolder}",
  },
  {
    type = "go",
    name = "Debug Test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug Test Package",
    request = "launch",
    mode = "test",
    program = "${workspaceFolder}",
  },
}
