" turn on left and right in command mode
nnoremap <Left>  <Left>
nnoremap <Right> <Right>

" turn on arrow keys in insert mode
inoremap <Left>  <Left>
inoremap <Down>  <Down>
inoremap <Up>    <Up>
inoremap <Right> <Right>

" scroll like less with up and down
nnoremap <silent> <Up> kzz
nnoremap <silent> <Down> jzz

" remap kk to ESC
inoremap <silent> kk <ESC>

" syntax highlighted fences!
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
