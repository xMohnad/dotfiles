vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("mariasolos/close_with_q", { clear = true }),
  desc = "Close with <q>",
  pattern = {
    "git",
    "help",
    "man",
    "qf",
    "scratch",
  },
  callback = function(args)
    if args.match ~= "help" or not vim.bo[args.buf].modifiable then
      vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("mariasolos/last_location", { clear = true }),
  desc = "Go to the last location when opening a buffer",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "kotlin", "python" },
  callback = function(ev)
    vim.treesitter.start(ev.buf)
    vim.bo[ev.buf].syntax = "ON"
  end,
})

-- Set up LSP servers.
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    -- Extend neovim's client capabilities with the completion ones.
    vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })

    local servers = vim
      .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end)
      :totable()
    vim.lsp.enable(servers)
  end,
})
