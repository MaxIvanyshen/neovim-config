require('trouble').setup()

-- Key mappings using nvim_set_keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Map Trouble commands to keys
map('n', '<leader>t', '<cmd>Trouble diagnostics toggle<CR>', opts)
map('n', '<leader>r', '<cmd>Trouble lsp toggle focus=true<CR>', opts)
map('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', opts)
map('n', '<leader>xf', '<cmd>Trouble qflist toggle<CR>', opts)

