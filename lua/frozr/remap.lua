vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", vim.cmd.Ex) -- Open directory view

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- Toggle UndoTree

-- Quickfix list things
vim.keymap.set("n", "<leader>l", '<cmd>cnext<CR>zz'); -- go to next item in quickfix list
vim.keymap.set("n", "<leader>h", '<cmd>cprev<CR>zz'); -- go to next item in quickfix list

vim.keymap.set("n", "<leader>]", '<cmd>cnewer<CR>zz'); -- go to next quickfix list
vim.keymap.set("n", "<leader>[", '<cmd>colder<CR>zz'); -- go to previous quickfix list

vim.keymap.set("n", "<leader>sf", 'yiw <cmd>execute \'vimgrep /\' . escape(@", \'/\') . \'/ %\'<CR>zz'); -- search for yanked word and move everything to quickfix list

-- Some useful stuff
vim.keymap.set("n", "<leader>vs", '<cmd>vsplit<CR><C-w>l'); -- split screen vertically and move to right split

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd('GoFmt')
  end,
  group = format_sync_grp,
})
