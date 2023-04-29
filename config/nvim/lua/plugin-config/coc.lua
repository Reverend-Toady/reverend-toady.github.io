-- COC
vim.cmd([[
let g:coc_global_extensions = [
            \'coc-marketplace',
            \'coc-syntax',
            \'coc-lists',
            \'coc-yank',
            \'coc-pairs',
            \'coc-lists',
            \'coc-snippets',
            \
            \'coc-css',
            \'coc-yaml',
            \'coc-html',
            \'coc-json',
            \'coc-pyright',
            \'coc-lua',
            \'coc-clangd',
            \'coc-rust-analyzer',
            \'coc-tsserver',
            \
            \'coc-cmake',
            \'coc-prettier',
            \'coc-git',
            \]
]])

vim.cmd([[
    inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
]])
