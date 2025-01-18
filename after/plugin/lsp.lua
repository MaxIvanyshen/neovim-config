local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

function GoFormatting()
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
            -- First run goimports to handle imports
            local imports_output = vim.fn.system("goimports", vim.fn.getline(1, "$"))
            if vim.v.shell_error == 0 then
                local imports_lines = vim.split(imports_output, "\n")
                -- Remove the last empty line if it exists
                if imports_lines[#imports_lines] == "" then
                    table.remove(imports_lines)
                end
                vim.api.nvim_buf_set_lines(0, 0, -1, false, imports_lines)
            end

            -- Then run gofmt for formatting
            local fmt_output = vim.fn.system("gofmt", vim.fn.getline(1, "$"))
            if vim.v.shell_error == 0 then
                local fmt_lines = vim.split(fmt_output, "\n")
                -- Remove the last empty line if it exists
                if fmt_lines[#fmt_lines] == "" then
                    table.remove(fmt_lines)
                end
                vim.api.nvim_buf_set_lines(0, 0, -1, false, fmt_lines)
            else
                print("gofmt failed: " .. vim.trim(fmt_output))
            end
        end,
    })
end
GoFormatting()

function PrettierFormatting()
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.css", "*.scss", "*.html"},
        callback = function()
            local current_view = vim.fn.winsaveview()  -- Save the current cursor position and view
            local prettier_output = vim.fn.system("prettier --write " .. vim.fn.expand("%:p"))
            
            if vim.v.shell_error == 0 then
                -- Reload the buffer without moving the cursor
                vim.cmd('edit!')
                vim.fn.winrestview(current_view)
            else
                print("Prettier formatting failed: " .. vim.trim(prettier_output))
            end
        end,
    })
end
PrettierFormatting()
