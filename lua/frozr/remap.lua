vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", vim.cmd.Ex) -- Open directory view

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- Toggle UndoTree

-- Quickfix list things
vim.keymap.set("n", "<leader>l", '<cmd>cnext<CR>zz'); -- go to next item in quickfix list
vim.keymap.set("n", "<leader>h", '<cmd>cprev<CR>zz'); -- go to next item in quickfix list

vim.keymap.set("n", "<leader>]", '<cmd>cnewer<CR>zz'); -- go to next quickfix list
vim.keymap.set("n", "<leader>[", '<cmd>colder<CR>zz'); -- go to previous quickfix list
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>");

vim.keymap.set("n", "<leader>sf", 'yiw <cmd>execute \'vimgrep /\' . escape(@", \'/\') . \'/ %\'<CR>zz'); -- search for yanked word and move everything to quickfix list

-- Some useful stuff
vim.keymap.set("n", "<leader>vs", '<cmd>vsplit<CR><C-w>l'); -- split screen vertically and move to right split

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Move selected lines down
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Move selected lines up

