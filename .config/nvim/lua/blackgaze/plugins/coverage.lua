return {
    "andythigpen/nvim-coverage",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("coverage").setup({
            commands = true, -- create commands
            highlights = {
                -- customize highlight groups created by the plugin
                covered = { fg = "#C3E88D" },   -- supports style, fg, bg, sp (see :h highlight-gui)
                uncovered = { fg = "#F07178" },
            },
            signs = {
                -- use your own highlight groups or text markers
                covered = { hl = "CoverageCovered", text = "▎" },
                uncovered = { hl = "CoverageUncovered", text = "▎" },
            },
            summary = {
                -- customize the summary pop-up
                min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
            },
            lang = {
                -- customize language specific settings
                javascript = {
                    pattern = "// %s",
                    coverage_file = "./reports/lcov.info",
                },
                typescript = {
                    pattern = "// %s",
                    coverage_file = "./reports/lcov.info",
                }
            },
        },
            vim.keymap.set("n", "<leader>cc", "<cmd>Coverage<cr>", { noremap = true, silent = true, desc = "Show coverage gutters" }),
            vim.keymap.set("n", "<leader>ct", "<cmd>CoverageToggle<cr>", { noremap = true, silent = true, desc = "Toggle coverage gutters" }),
            vim.keymap.set("n", "<leader>cC", "<cmd>CoverageSummary<cr>", { noremap = true, silent = true, desc = "Show coverage summary" })
        )
    end,
}
