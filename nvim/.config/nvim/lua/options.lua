require "nvchad.options"

-- add yours here!
local o = vim.opt

o.mouse = "v"
o.wrap = false
o.updatetime = 600


-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable filetype detection, plugins, and indentation
vim.cmd([[
  filetype plugin indent on
]])

-- o.cursorlineopt ='both' -- to enable cursorline!
