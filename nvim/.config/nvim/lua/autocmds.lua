require "nvchad.autocmds"

-- Show diagnostic floating window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      border = "rounded",
      source = "if_many",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs

    -- Open Nvdash when the last buffer is deleted
    if bufs and #bufs == 1 then
      local buf_name = vim.api.nvim_buf_get_name(bufs[1])

      if buf_name == "" then
        vim.cmd "Nvdash"
      end
    end
  end,
})

-- Configure LSP client attachments (inlay hints, document highlight)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    -- Enable Inlay Hints if the server supports it
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Create Highlight autocmds only in the current buffer and if the server supports it
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
