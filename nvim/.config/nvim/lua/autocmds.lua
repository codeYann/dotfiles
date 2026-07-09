require "nvchad.autocmds"

local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Enable cursorline in active windows
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = augroup,
  callback = function()
    vim.wo.cursorline = true
  end,
})

-- Disable cursorline when leaving a window
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = augroup,
  callback = function()
    vim.wo.cursorline = false
  end,
})

-- Show diagnostic floating window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  group = augroup,
  callback = function()
    if vim.fn.mode() ~= "n" then
      return
    end

    local opts = {
      focusable = false,
      border = "rounded",
      source = "if_many",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- Highlight yanked text momentarily
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 150,
    }
  end,
})

-- Restore cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Open Nvdash when the last buffer is deleted
vim.api.nvim_create_autocmd("BufDelete", {
  group = augroup,
  callback = function()
    local bufs = vim.t.bufs

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

    -- Set up document highlight on hold, clear on move, if the server supports it
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

      vim.api.nvim_create_autocmd("LspDetach", {
        group = highlight_augroup,
        buffer = bufnr,
        callback = function(detach_args)
          vim.lsp.buf.clear_references()

          local detaching_id = detach_args.data and detach_args.data.client_id

          for _, c in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
            if c.id ~= detaching_id and c.server_capabilities.documentHighlightProvider then
              return
            end
          end

          vim.api.nvim_clear_autocmds {
            group = highlight_augroup,
            buffer = bufnr,
          }
        end,
      })
    end
  end,
})
