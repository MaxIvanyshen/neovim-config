require("CopilotChat").setup {
  -- See Configuration section for options
  model = 'claude-3.7-sonnet'

}

-- https://github.com/CopilotC-Nvim/CopilotChat.nvim

-- Optional: Customize the keymaps
vim.keymap.set("n", "<leader>gcc", '<cmd>CopilotChatToggle<CR>zz');
vim.keymap.set("n", "<leader>gcs", '<cmd>CopilotChatStop<CR>zz');

-- Generate docs
vim.keymap.set("n", "<leader>gcd", '<cmd>CopilotChatDocs<CR>zz');
vim.keymap.set("v", "<leader>gcd", '<cmd>CopilotChatDocs<CR>zz');

-- Generate tests
vim.keymap.set("n", "<leader>gct", '<cmd>CopilotChatTests<CR>zz');
vim.keymap.set("v", "<leader>gct", '<cmd>CopilotChatTests<CR>zz');

-- Generate commit message
vim.keymap.set("n", "<leader>gcm", '<cmd>CopilotChatCommit<CR>zz');
