local dap = require "dap"

local mason_path = vim.fn.stdpath "data" .. "/mason"

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      mason_path .. "/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

for _, language in ipairs {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
} do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch current file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
  }
end
