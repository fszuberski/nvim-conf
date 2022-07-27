require "core"
require "plugins"

-- automatically format files before saving them
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
