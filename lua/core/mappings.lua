local Remap = require "core.remap"
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

-- navigate within insert mode
inoremap("<A-h>", "<Left>")
inoremap("<A-l>", "<Right>")
inoremap("<A-j>", "<Down>")
inoremap("<A-k>", "<Uo>")

-- save all
nnoremap("<leader>w", "<cmd> wa <CR>")

-- delete to void register and paste
xnoremap("<leader>p", "\"_dP")

-- move highlighted text up and own
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- window manipulation
nnoremap("<leader>wv", "<C-w>v") -- split vertical
nnoremap("<leader>ws", "<C-w>s") -- split horizontal
nnoremap("<leader>ww", "<C-w>w")
nnoremap("<leader>wh", "<C-w>h")
nnoremap("<leader>wl", "<C-w>l")
nnoremap("<leader>wj", "<C-w>j")
nnoremap("<leader>wk", "<C-w>k")

-- nvim-tree
nnoremap("<leader>tt", "<cmd> NvimTreeToggle <CR>")
nnoremap("<leader>tf", "<cmd> NvimTreeFocus <CR>")
nnoremap("<leader>to", "<cmd> NvimTreeFindFile <CR>")

