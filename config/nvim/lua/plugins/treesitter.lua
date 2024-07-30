return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensured_installed = {
                "bash",
                "fish",
                "javascript",
                "typescript",
                "lua",
                "rust",
                "python",
                "vim",
                "diff",
                "markdown",
            },
            auto_install = true,
            hightlight = { enable = true },
            indent = { enable = true }
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
    -- Keeps first line of block in view when scrolling
    {
        "nvim-treesitter/nvim-treesitter-context"
    }
}
