vim.g.tokyonight_lualine_bold = true
local colors = require("tokyonight.colors").setup({}) -- pass in any of the config options as explained above

vim.cmd [[colorscheme tokyonight]]

vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.green })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = colors.green })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = colors.green })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.red1 })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = colors.red1 })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = colors.red1 })
