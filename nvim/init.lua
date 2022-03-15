require ('settings')


return require('packer').startup(function()
        use 'wbthomason/packer.nvim'
        use {'neoclide/coc.nvim', branch = 'release' }
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'pwntester/octo.nvim'
        use 'jiangmiao/auto-pairs'
        use 'machakann/vim-sandwich'
end)
