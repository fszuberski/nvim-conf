local Remap = require "core.remap"
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic

-- clear highlight after search
nnoremap("<ESC>", "<cmd> noh <CR>")

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

-- bufferline
nnoremap("<TAB>", "<cmd> BufferLineCycleNext <CR>")
nnoremap("<S-TAB>", "<cmd> BufferLineCyclePrev <CR>")
nnoremap("<leader>bn", "<cmd> BufferLineMoveNext <CR>")
nnoremap("<leader>bp", "<cmd> BufferLineMovePrev <CR>")
nnoremap("<leader>wq", "<cmd> bdelete <CR>")

-- nvim-tree
nnoremap("<leader>tt", "<cmd> NvimTreeToggle <CR>")
nnoremap("<leader>tf", "<cmd> NvimTreeFocus <CR>")
nnoremap("<leader>to", "<cmd> NvimTreeFindFile <CR>")

-- lsp
nnoremap("K", function() lsp.hover() end)
nnoremap("gD", function() lsp.declaration() end)
nnoremap("<leader>rn", function() lsp.rename() end)
nnoremap("<leader>fc", function() lsp.formatting() end)
nnoremap("<leader>sh", function() lsp.signature_help() end)
nnoremap("<leader>ca", function() lsp.code_action() end)
nnoremap("<leader>sd", function() diagnostic.open_float() end)
-- basic remaps overridden by telescope; check 'telescope lsp'
nnoremap("lgr", function() lsp.references() end)
nnoremap("lgd", function() lsp.definition() end)
nnoremap("lgi", function() lsp.implementation() end)
nnoremap("<leader>ltd", function() lsp.type_definition() end)

-- telescope
nnoremap("<C-f>", "<cmd> Telescope current_buffer_fuzzy_find fuzzy=false case_mode=respect_case <CR>")
nnoremap("<leader>fa", "<cmd> Telescope live_grep fuzzy=false case_mode=respect_case <CR>")
nnoremap("<leader>fz", "<cmd> Telescope live_grep <CR>")
nnoremap("<leader>fs", "<cmd> Telescope grep_string <CR>")
nnoremap("<leader>ff", "<cmd> Telescope find_files <CR>")
nnoremap("<leader>fv", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
nnoremap("<leader>fb", "<cmd> Telescope buffers <CR>")
nnoremap("<leader>fh", "<cmd> Telescope help_tags <CR>")
nnoremap("<leader>fo", "<cmd> Telescope oldfiles <CR>")
nnoremap("<leader>tk", "<cmd> Telescope keymaps <CR>")
-- telescope lsp
nnoremap("gr", "<cmd> Telescope lsp_references <CR>")
nnoremap("gd", "<cmd> Telescope lsp_definitions <CR>")
nnoremap("td", "<cmd> Telescope lsp_type_definitions <CR>")
nnoremap("gi", "<cmd> Telescope lsp_implementations <CR>")
