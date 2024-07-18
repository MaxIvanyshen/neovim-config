-- Lua configuration for Trouble.nvim with key mappings
require("trouble").setup {
    -- Configuration options for Trouble
    -- opts = {},  -- You can add custom options here, refer to Trouble documentation

    -- Commands and key mappings
    mappings = {
        -- Toggle commands and their key mappings
        diagnostics = "<leader>xx",              -- Toggle diagnostics
        diagnostics_filter = "<leader>xX",       -- Toggle buffer diagnostics
        symbols = "<leader>cs",                  -- Toggle symbols
        lsp_references = "<leader>cl",           -- Toggle LSP references
        loclist = "<leader>xL",                  -- Toggle location list
        quickfix = "<leader>xQ",                 -- Toggle quickfix list
    },
}

-- Key mappings using nvim_set_keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Map Trouble commands to keys
map('n', '<leader>t', '<cmd>Trouble diagnostics toggle<CR>', opts)
map('n', '<leader>r', '<cmd>Trouble lsp toggle focus=true<CR>', opts)
map('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', opts)
map('n', '<leader>xf', '<cmd>Trouble qflist toggle<CR>', opts)

