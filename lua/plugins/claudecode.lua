return {
    "coder/claudecode.nvim",
    ---@module "claudecode"
    ---@type ClaudeCode.Config
    opts = {},
    config = true,
    keys = {
        { "<leader>a",  nil,                              desc = "AI/Claude Code" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v", desc = "Send selection" },
        {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file from tree",
            ft = { "oil", "NvimTree", "neo-tree", "minifiles", "netrw" },
        },
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    },
}
