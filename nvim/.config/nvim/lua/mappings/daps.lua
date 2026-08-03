local map = vim.keymap.set

map("n", "<F5>", function()
  require("dap").continue()
end, {
  desc = "Debug: Start/Continue",
})
map("n", "<F10>", function()
  require("dap").step_over()
end, {
  desc = "Debug: Step Over",
})
map("n", "<F11>", function()
  require("dap").step_into()
end, {
  desc = "Debug: Step Into",
})
map("n", "<F12>", function()
  require("dap").step_out()
end, {
  desc = "Debug: Step Out",
})
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, {
  desc = "Debug: Toggle Breakpoint",
})
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, {
  desc = "Debug: Conditional Breakpoint",
})
map("n", "<leader>dl", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point: ")
end, {
  desc = "Debug: Log Point",
})
map("n", "<leader>dr", function()
  require("dap").repl.open()
end, {
  desc = "Debug: REPL",
})
map("n", "<leader>dc", function()
  require("dap").run_to_cursor()
end, {
  desc = "Debug: Run to Cursor",
})
map("n", "<leader>dt", function()
  require("dap").terminate()
end, {
  desc = "Debug: Terminate",
})
map("n", "<leader>du", function()
  require("dapui").toggle()
end, {
  desc = "Debug: Toggle UI",
})
