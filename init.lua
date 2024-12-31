require("frozr")

-- Format Go files on save using gofmt
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local filepath = vim.fn.expand("%:p") -- Get the full file path
        local formatted = vim.fn.system("gofmt", vim.fn.getline(1, "$")) -- Format the file content with gofmt

        if vim.v.shell_error == 0 then
            -- Replace buffer content with formatted text
            vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(formatted, "\n"))
        else
            print("gofmt failed: " .. vim.trim(formatted))
        end
    end,
})

