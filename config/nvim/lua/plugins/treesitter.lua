return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() 
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensured_installed = {
                    "bash",
                    "fish",
                    "javascript",
                    "typescript",
                    "lua",
                    "rust"
                },
                auto_install = true,
                hightlight = {enable = true},
                indent = {enable = true}
            })
        end
    }
}
