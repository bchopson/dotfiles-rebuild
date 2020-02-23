if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($HOME . '/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

" language plugins
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-markdown'
Plug 'moll/vim-node'
Plug 'lepture/vim-jinja'
Plug 'vim-python/python-syntax'
Plug 'zah/nim.vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'heavenshell/vim-pydocstring'
Plug 'fisadev/vim-isort'
Plug 'mattn/emmet-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

" front end web development
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'burnettk/vim-angular'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ap/vim-css-color'

" vim helpers
Plug 'ntpeters/vim-better-whitespace'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-expand-region'
Plug 'mtth/scratch.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'PeterRincker/vim-argumentative'
Plug 'craigemery/vim-autotag'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" tpope
Plug 'tpope/vim-abolish'
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

" GitHub
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" quick searching
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
Plug 'mileszs/ack.vim'

" color themes
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'alessandroyorba/despacio'
Plug 'alessandroyorba/alduin'
Plug 'alessandroyorba/arcadia'
Plug 'tlhr/anderson.vim'

call plug#end()
