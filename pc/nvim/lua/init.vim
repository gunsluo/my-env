lua require('basic')

for f in split(glob('~/.config/nvim/lua/*.*'), '\n')
   exe 'source' f
endfor

" lua require('lsp')
