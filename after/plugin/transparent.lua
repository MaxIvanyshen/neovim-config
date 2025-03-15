 -- Optional, you don't have to run setup.
require("transparent").setup({
  -- table: default groups
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  -- table: additional groups that should be cleared
  extra_groups = {},
  -- table: groups you don't want to clear
  exclude_groups = {},
  -- function: code to be executed after highlight groups are cleared
  -- Also the user event "TransparentClear" will be triggered
  on_clear = function() end,
})

-- Highlight settings for transparency
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')        -- Focused
vim.cmd('highlight NormalNC ctermbg=NONE guibg=NONE')      -- Unfocused
vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')      -- Unfocused
-- vim.cmd('highlight NonText ctermbg=NONE guibg=NONE')       -- Non-text characters
-- vim.cmd('highlight LineNr ctermbg=NONE guibg=NONE')        -- Line numbers
-- 
-- -- Cursor line and selection highlights
-- vim.cmd('highlight CursorLine guibg=NONE')                  -- Cursor line highlight
-- vim.cmd('highlight Visual guibg=#6699cc')                    -- Visual selection background (adjust color)
-- vim.cmd('highlight CursorLineNr guibg=NONE')                -- Cursor line number highlight
-- 
-- -- Explorer-specific or buffer-related highlights (adjust these as needed)
-- vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')         -- Focused pane
-- vim.cmd('highlight GitSignsAdd guibg=NONE ctermbg=NONE')    -- Git signs if applicable
-- vim.cmd('highlight GitSignsChange guibg=NONE ctermbg=NONE')  -- Git signs if applicable
-- vim.cmd('highlight GitSignsDelete guibg=NONE ctermbg=NONE')  -- Git signs if applicable
