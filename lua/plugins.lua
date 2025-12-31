return {
    { "EdenEast/nightfox.nvim" },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "haskell", "python", "go", "javascript", "typescript", "lua", "vim" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
          window = {
            width = 30,
          },
        })
      end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                })
            })
        end
    },
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        config = function ()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = { "hls", "pyright", "gopls", "tsserver"},
                handlers = {
                    function (server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                }
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Definition' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP Declaration' })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP Implementation' })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'LSP References' })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
            vim.keymap.set('n', '<leader>fm', vim.diagnostic.open_float, { desc = 'LSP Diagnostics' })
        end
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('bufferline').setup{}
        end
    },
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      config = function()
        require("dashboard").setup({
          theme = "hyper",
          config = {
            center = {
              { icon = "", desc = " New File", action = "enew", key = "n" },
              { icon = "", desc = " Find File", action = "Telescope find_files", key = "f" },
              { icon = "", desc = " Recent Files", action = "Telescope oldfiles", key = "r" },
              { icon = "", desc = " Projects", action = "Telescope projects", key = "p" },
              { icon = "", desc = " Configuration", action = "e ~/.config/nvim/init.lua", key = "c" },
              { icon = "Q", desc = " Quit Neovim", action = "qa", key = "q" },
            },
          },
        })
      end,
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      }
    }
}
