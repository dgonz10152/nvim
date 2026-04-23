return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "master",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "html" },
            highlight = { enable = true },
        })
    end,
}
