-- Set <space> as the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use an indentation of 2 apaces.
vim.o.sw = 2
vim.o.ts = 2
vim.o.et = true

-- Show whitespace.
vim.o.showmode = false
-- vim.opt.listchars = { space = '⋅', trail = '⋅', tab = '  ↦' }

-- Use a virtual style for document color
vim.lsp.document_color.enable(true, nil, { style = "virtual" })

-- UI characters.
vim.opt.fillchars = { eob = " " }

-- Show line numbers.
vim.wo.number = true
vim.opt.relativenumber = true
vim.o.numberwidth = 2

-- Wraping.
vim.o.wrap = false

-- Enable mouse mode.
vim.o.mouse = "a"

-- Disable horizontal scrolling.
vim.o.mousescroll = "ver:3,hor:0"

-- Use rounded borders for floating windows.
vim.o.winborder = "rounded"

-- Save undo history.
vim.o.undofile = true

-- Enable project-local configuration.
vim.o.exrc = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
vim.wo.signcolumn = "yes"

-- Update times and timeouts.
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion.
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15
vim.o.pumborder = "rounded"

-- Diff mode settings.
-- Setting the context to a very large number disables folding.
vim.opt.diffopt:append("vertical,context:99")

vim.opt.shortmess:append({
  w = true,
  s = true,
})

vim.diagnostic.config({
  virtual_lines = { current_line = true },
  virtual_text = false,
})

-- Status line.
vim.o.laststatus = 3
vim.o.cmdheight = 1

-- Disable cursor blinking in terminal mode.
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
