return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'dev-v3'
    },
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

        }
    }
}
