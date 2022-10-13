local nnoremap = require("mert.keymap").nnoremap
local vnoremap = require("mert.keymap").vnoremap
local tnoremap = require("mert.keymap").tnoremap

-- Move text with tap im v mode
vnoremap("<Tab>", ">gv")
vnoremap("<S-Tab>", "<gv")

-- replace
vnoremap("//", "\"hy/<C-r>h<CR>")
vnoremap("<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

-- terminal
nnoremap("<leader>tm", ":vsp<CR>:terminal<CR>i")
tnoremap("<C-q>", "<C-\\><C-n>")
tnoremap("<C-J>", "<C-\\><C-n><C-W><C-J>")
tnoremap("<C-K>", "<C-\\><C-n><C-W><C-K>")
tnoremap("<C-H>", "<C-\\><C-n><C-W><C-H>")

-- splits
nnoremap("<C-J>", "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")
nnoremap("<leader>sh", ":sp<CR>")
nnoremap("<leader>sv", ":vsp<CR>")
