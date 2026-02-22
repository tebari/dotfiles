return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "fish",
                "javascript",
                "typescript",
                "jsdoc",
                "lua",
                "luadoc",
                "rust",
                "python",
                "vim",
                "diff",
                "c",
                "markdown",
                "markdown_inline",
                "query",
                "vimdoc",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- Keeps first line of block in view when scrolling
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
}
