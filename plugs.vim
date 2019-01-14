if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($HOME . '/.vim/plugged')

" language plugins
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-markdown'
Plug 'moll/vim-node'
Plug 'lepture/vim-jinja'
Plug 'vim-python/python-syntax'

" front end web development
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'burnettk/vim-angular'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'mxw/vim-jsx'

" vim helpers
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-expand-region'
Plug 'mtth/scratch.vim'
Plug 'terryma/vim-multiple-cursors'

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" quick searching
if executable('ag')
  Plug 'rking/ag.vim'
elseif executable('ack')
  Plug 'mileszs/ack.vim'
endif

" color themes
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()
