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
            {'hrsh7th/cmp-nvim-lsp'}
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'}
        }
    }
}
