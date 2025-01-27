require("gitblame").setup({
    enabled = false
})

vim.keymap.set("n", "<leader>gb", ':GitBlameToggle<CR>'); 
