local dap = require "dap"
local dapui = require "dapui"

dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui"] = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })

vim.fn.sign_define("DapBreakpointCondition", {
  text = "◆",
  texthl = "DiagnosticWarn",
})

vim.fn.sign_define("DapLogPoint", {
  text = "◆",
  texthl = "DiagnosticInfo",
})

vim.fn.sign_define(
  "DapStopped",
  { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "DiagnosticWarn" }
)

vim.fn.sign_define("DapBreakpointRejected", {
  text = "",
  texthl = "DiagnosticError",
})

require "configs.dap.go"
require "configs.dap.node"
require "configs.dap.cpp"
