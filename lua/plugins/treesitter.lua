return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "master",
    config = function()
        vim.filetype.add({
            pattern = {
                ["%.env"] = "sh",
                ["%.env%.[%w_.-]+"] = "sh",
            },
        })

        require("nvim-treesitter.configs").setup({
            ensure_installed = { "html", "bash", "python" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
