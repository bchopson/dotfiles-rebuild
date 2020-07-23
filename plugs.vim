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
Plug 'glench/vim-jinja2-syntax'
Plug 'vim-python/python-syntax'
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }
Plug 'zah/nim.vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Neovim support removed in 2.0.0?
" Plug 'heavenshell/vim-pydocstring'
Plug 'fisadev/vim-isort'
Plug 'mattn/emmet-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" For deoplete, vim only
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" front end web development
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'burnettk/vim-angular'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chrisbra/Colorizer'

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
Plug 'farmergreg/vim-lastplace'
Plug 'preservim/nerdtree'
Plug 'lambdalisue/suda.vim'

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
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
" Mostly :Verbose to view mappings
Plug 'tpope/vim-scriptease'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" GitHub
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" quick searching
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
Plug 'mileszs/ack.vim'

" color themes
Plug 'lifepillar/vim-colortemplate'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'fcpg/vim-farout'
Plug 'liuchengxu/space-vim-theme'
Plug 'aonemd/kuroi.vim'
Plug 'flrnd/candid.vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'ntk148v/vim-horizon'


call plug#end()
