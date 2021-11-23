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

local opts = {noremap = true, silent = true}

-- key map for switching splits
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Clear highlight after search
vim.api.nvim_set_keymap("n", "<leader><Space>", ":noh<CR>", opts)

-- TAB in general mode will move to text buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Move selected line / block of text in visual mode
-- shift + k to move up
-- shift + j to move down
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Alternate way to save and quit
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-q>", ":wq!<CR>", opts)

-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- keymap for opening nvim config file
vim.api.nvim_set_keymap("n", "<leader>ie", ":vsp $MYVIMRC<CR>", opts)

-- Terminal keymap
vim.cmd [[au BufEnter * if &buftype == 'terminal' | :startinsert | endif]]
vim.api.nvim_set_keymap("n", "<leader>st", ":split term://bash | resize 20<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vt", ":vsplit term://bash<CR>", opts)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
