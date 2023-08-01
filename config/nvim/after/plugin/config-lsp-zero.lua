local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.extend_cmp()

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {'lua_ls'},
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end
    }
})
