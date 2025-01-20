require("dap-go").setup()

local dap, dapui = require('dap'), require('dapui')
local dapgo = require('dap-go')
dapui.setup()
dapgo.setup()
dap.listeners.before.attach.dapui_config = function()
 dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
 dapui.open()
end


-- Include the next few lines until the comment only if you feel you need it
dap.listeners.before.event_terminated.dapui_config = function()
 dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
 dapui.close()
end
-- Include everything after this

local repl = require 'dap.repl'
repl.commands = vim.tbl_extend('force', repl.commands, {
 
  -- Add a new alias for existing commands
  exit = {'exit', '.exit'},
  
  -- Add new commands
  custom_commands = {
    ['.print'] = function(v)
      repl.execute(v)
    end,
  },
})


vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function()
require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function()
require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>rl', function() require('dap').run_last() end)

vim.keymap.set('n', '<Leader>w', function() dapui.open() end)
vim.keymap.set('n', '<Leader>W', function() dapui.close() end)
