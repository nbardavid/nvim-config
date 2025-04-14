return {
    'roginfarrer/cmp-css-variables',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
        require'cmp'.setup {
            sources = {
                { name = 'nvim_lsp' },
                { name = 'css-variables' }
            }
        }
    end
}
