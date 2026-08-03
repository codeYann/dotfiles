local map = vim.keymap.set

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
