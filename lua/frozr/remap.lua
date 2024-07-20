vim.g.mapleader = " "

-- Open directory view
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

-- Toggle UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Quickfix list things
vim.keymap.set("n", "<leader>l", '<cmd>cnext<CR>zz'); -- go to next item in quickfix list
vim.keymap.set("n", "<leader>h", '<cmd>cprev<CR>zz'); -- go to next item in quickfix list

vim.keymap.set("n", "<leader>]", '<cmd>cnewer<CR>zz'); -- go to next quickfix list
vim.keymap.set("n", "<leader>[", '<cmd>colder<CR>zz'); -- go to previous quickfix list

vim.keymap.set("n", "<leader>sf", 'yiw <cmd>execute \'vimgrep /\' . escape(@", \'/\') . \'/ %\'<CR>zz'); -- go to next item in quickfix list
