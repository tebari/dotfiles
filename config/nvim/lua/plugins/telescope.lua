local function TBuiltin(builtin_name, opts)
    return function()
        local picker = builtin_name
        local picker_opts = vim.deepcopy(opts or {})

        if picker == "files" then
            if vim.loop.fs_stat((picker_opts.cwd or vim.loop.cwd()) .. "/.git") then
                picker_opts.show_untracked = true
                picker = "git_files"
            else
                picker = "find_files"
            end
        end

        require("telescope.builtin")[picker](picker_opts)
    end
end

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- Useful for getting pretty icons, but requires a Nerd Font.
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        keys = {
            { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
            { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
            { "<leader><space>", TBuiltin("files"), desc = "Find Files (root dir)" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
            {
                "<leader>ss",
                TBuiltin("lsp_document_symbols", {
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                }),
                desc = "Goto Symbol",
            },
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("fzf")
        end,
    },
}
