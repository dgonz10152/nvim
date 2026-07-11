return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "^%.git/", "node_modules/", "^%.DS_Store$", "^%.next/", "^%.node/" },
                layout_strategy = "flex",
                layout_config = {
                    flex = { flip_columns = 130 },
                    horizontal = {
                        preview_width = 0.55,
                        prompt_position = "top",
                        preview_cutoff = 0,
                    },
                    vertical = {
                        preview_height = 0.5,
                        prompt_position = "top",
                        mirror = true,
                        preview_cutoff = 0,
                    },
                    width = 0.9,
                    height = 0.85,
                },
                sorting_strategy = "ascending",
            },
            pickers = {
                find_files = {
                    -- Respect .gitignore, but re-add .env and .env.local (which are usually gitignored)
                    find_command = {
                        "sh",
                        "-c",
                        [[ { fd --type f --hidden --exclude .git; fd --type f --hidden --no-ignore --exclude .git '^\.env(\.local)?$'; } | awk '!seen[$0]++' ]],
                    },
                    previewer = true,
                },
            },
        })
    end,
}
