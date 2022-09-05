local Remap = require "core.remap"
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic

local neotest = require "neotest"
local coverage = require "coverage"
local neogit = require "neogit"

-- clear highlight after search
nnoremap("<ESC>", "<cmd> noh <CR>")

-- navigate within insert mode
inoremap("<A-h>", "<Left>")
inoremap("<A-l>", "<Right>")
inoremap("<A-j>", "<Down>")
inoremap("<A-k>", "<Up>")

-- save all
nnoremap("<leader>w", "<cmd> wa <CR>")

-- copy relative file name to unamed register
nnoremap("<leader>fp", "<cmd> let @+=expand(\"%:p:.\") <CR>")

-- delete to void register and paste
xnoremap("<leader>p", "\"_dP")

-- keep selection after changing indentation
vnoremap("<", "<gv")
vnoremap(">", ">gv")
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
nnoremap("<leader>wc", "<C-w>c")

-- bufferline
nnoremap("<A-TAB>", "<cmd> BufferLineCycleNext <CR>")
nnoremap("<S-TAB>", "<cmd> BufferLineCyclePrev <CR>")
nnoremap("<leader>bn", "<cmd> BufferLineMoveNext <CR>")
nnoremap("<leader>bp", "<cmd> BufferLineMovePrev <CR>")
nnoremap("<leader>wq", "<cmd> bdelete <CR>")
nnoremap("<leader>wq", "<cmd> bp|bd # <CR>")

-- nvim-tree
nnoremap("<leader>tt", "<cmd> NvimTreeToggle <CR>")
nnoremap("<leader>tf", "<cmd> NvimTreeFocus <CR>")
nnoremap("<leader>to", "<cmd> NvimTreeFindFile <CR>")
nnoremap("<leader>tr", "<cmd> NvimTreeRefresh <CR>")

-- lsp
nnoremap("gD", function() lsp.declaration() end)
nnoremap("<leader>fc", function() lsp.formatting() end)
nnoremap("<leader>sd", function() diagnostic.open_float() end)
-- remaps overridden by lspsaga
-- nnoremap("K", function() lsp.hover() end)
-- nnoremap("<leader>rn", function() lsp.rename() end)
-- nnoremap("<leader>sh", function() lsp.signature_help() end)
-- nnoremap("<leader>ca", function() lsp.code_action() end)
-- base remaps overridden by telescope; check 'telescope lsp'
nnoremap("gR", function() lsp.references() end)
nnoremap("gD", function() lsp.definition() end)
nnoremap("gI", function() lsp.implementation() end)
nnoremap("tD", function() lsp.type_definition() end)

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
nnoremap("gi", "<cmd> Telescope lsp_implementations <CR>")
nnoremap("td", "<cmd> Telescope lsp_type_definitions <CR>")

-- lspsaga
nnoremap("K", "<cmd> Lspsaga hover_doc <CR>")
nnoremap("gy", "<cmd> Lspsaga lsp_finder <CR>")
nnoremap("<leader>ca", "<cmd> Lspsaga code_action <CR>")
nnoremap("<leader>sh", "<cmd> Lspsaga signature_help <CR>")
nnoremap("<leader>rn", "<cmd> Lspsaga rename <CR>")

-- diffview
nnoremap("<leader>dvo", "<cmd> DiffviewOpen <CR>")
nnoremap("<leader>dvc", "<cmd> DiffviewClose <CR>")
nnoremap("<leader>dvh", "<cmd> DiffviewFileHistory % <CR>")

-- neogit
nnoremap("<leader>ng", function() neogit.open() end)

-- harpoon
nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<A-f>", function() require("harpoon.ui").nav_file(1) end)
nnoremap("<A-d>", function() require("harpoon.ui").nav_file(2) end)
nnoremap("<A-s>", function() require("harpoon.ui").nav_file(3) end)
nnoremap("<A-a>", function() require("harpoon.ui").nav_file(4) end)
nnoremap("<A-r>", function() require("harpoon.ui").nav_file(5) end)
nnoremap("<A-e>", function() require("harpoon.ui").nav_file(6) end)
nnoremap("<A-w>", function() require("harpoon.ui").nav_file(7) end)
nnoremap("<A-q>", function() require("harpoon.ui").nav_file(8) end)

-- neotest
nnoremap("<leader>nt", function() neotest.run.run() end)
nnoremap("<leader>nr", function() neotest.run.run() end)
nnoremap("<leader>nT",
    function() neotest.run.run({ extra_args = { "-covermode=atomic", "-coverprofile=coverage.out" } }) end)
nnoremap("<leader>nf", function() neotest.run.run(vim.fn.expand("%")) end)
nnoremap("<leader>nF", function() neotest.run.run({ vim.fn.expand("%"), extra_args = { "-covermode=atomic", "-coverprofile=coverage.out"}}) end)
nnoremap("<leader>nl", function() neotest.run.run_last() end)
nnoremap("<leader>nL",
    function() neotest.run.run_last({ extra_args = { "-covermode=atomic", "-coverprofile=coverage.out" } }) end)
nnoremap("<leader>nd", function() neotest.run.run({ strategy = "dap" }) end)
nnoremap("<leader>ndl", function() neotest.run.run_last({ strategy = "dap" }) end)
nnoremap("<leader>ns", function() neotest.run.stop() end)
nnoremap("<leader>na", function() neotest.run.attach() end)
nnoremap("<leader>no", function() neotest.output.open() end)
nnoremap("<leader>so", function() neotest.summary.open() end)
nnoremap("<leader>sc", function() neotest.summary.close() end)
nnoremap("<leader>st", function() neotest.summary.toggle() end)
nnoremap("<leader>nmr", function() neotest.summary.run_marked() end)
nnoremap("<leader>nmc", function() neotest.summary.clear_marked() end)

-- coverage
nnoremap("<leader>ko", function() coverage.load(); coverage.show() end)
nnoremap("<leader>kt", function() coverage.toggle() end)
nnoremap("<leader>kc", function() coverage.hide() end)
nnoremap("<leader>kl", function() coverage.load() end)
nnoremap("<leader>ks", function() coverage.summary() end)

-- git-conflict
--[[ nnoremap("<leader>cn", "<cmd> GitConflictNextConflict <CR>")
nnoremap("<leader>cp", "<cmd> GitConflictPrevConflict <CR>")
nnoremap("<leader>cq", "<cmd> GitConflictListQf <CR>") ]]
