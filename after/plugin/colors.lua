
function Color(color)
    color = color or "tokyonight-moon"
    vim.cmd.colorscheme(color)
    vim.cmd [[highlight LineNr guifg=#ff757f]]  -- Set color for line numbers
    vim.cmd [[highlight SignColumn guifg=#ff757f]]  -- Set color for line numbers
end

Color()

