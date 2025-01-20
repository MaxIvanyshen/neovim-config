
function Color(color)
    color = color or "tokyonight-moon"
    vim.cmd.colorscheme(color)

    -- Enable for transparent background
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    --vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none"})
    --vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none"})
end

Color()

