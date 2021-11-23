--set leader key
vim.g.mapleader = ","

--set line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- tab and indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- copy to clipboard"
vim.opt.clipboard = "unnamedplus"

-- set cursorline"
vim.opt.cursorline = true

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- highlight copied text
vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"

-- treat dash separated words as a word text object
vim.opt.iskeyword:append("-")


