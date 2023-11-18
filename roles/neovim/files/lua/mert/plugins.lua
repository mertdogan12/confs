vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- COC
    use { 'neoclide/coc.nvim', branch = 'release' }
    use { 'prettier/vim-prettier', run = 'yarn install' }
    use { 'OmniSharp/omnisharp-vim' }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- commenting
    use 'numToStr/Comment.nvim'

    -- theme
    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                    terminal_colors = true,
                },
            })

            vim.cmd.colorscheme 'github_dark'
        end,
    })

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })

    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- rust
    use 'rust-lang/rust.vim'

    -- arduinio
    use { 'stevearc/vim-arduino' }

    -- hologram
    use { 'edluffy/hologram.nvim' }
end)
