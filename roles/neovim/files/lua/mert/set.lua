vim.g.mapleader = "ß"

vim.opt.guifont = "Hack Nerd Font"
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3

vim.opt.mouse = "nv"

vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.cmd.colorscheme 'github_dark_colorblind'
