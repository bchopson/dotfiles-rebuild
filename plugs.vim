if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($HOME . '/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

" language plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'simrat39/symbols-outline.nvim'
Plug 'stevearc/aerial.nvim'
Plug 'psf/black', {'tag': '21.12b0'}
Plug 'zah/nim.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'racer-rust/vim-racer'
Plug 'kchmck/vim-coffee-script'
Plug 'raimon49/requirements.txt.vim'
Plug 'mattn/emmet-vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'vim-test/vim-test'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Clojure, 'cause I don't have emacs
Plug 'Olical/conjure', {'tag': 'v4.19.0'}
Plug 'guns/vim-clojure-static'
Plug 'dmac/vim-cljfmt'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'junegunn/rainbow_parentheses.vim'

" front end web development
Plug 'ruanyl/vim-sort-imports'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}

" vim helpers
Plug 'ntpeters/vim-better-whitespace'
Plug 'neovim/nvim-lspconfig'
Plug 'phaazon/hop.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-expand-region'
Plug 'mtth/scratch.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'PeterRincker/vim-argumentative'
Plug 'farmergreg/vim-lastplace'
Plug 'mcchrish/nnn.vim'
Plug 'lambdalisue/suda.vim'
Plug 'jacquesbh/vim-showmarks'
Plug 'mbbill/undotree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim', {'branch': 'main'}
Plug 'folke/todo-comments.nvim', {'branch': 'main'}
Plug 'folke/which-key.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'

Plug 'mhinz/vim-startify'

" tpope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" GitHub
Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(0)}}

" quick searching
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
Plug 'mileszs/ack.vim'

" color theme stuff
Plug 'rktjmp/lush.nvim', {'branch': 'main'}
Plug 'folke/lsp-colors.nvim'

" color themes
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'flrnd/candid.vim'
Plug 'ntk148v/vim-horizon'
Plug 'heraldofsolace/nisha-vim'
Plug 'axvr/photon.vim'
Plug 'bchopson/oak'
Plug 'cseelus/vim-colors-lucid'
Plug 'vv9k/bogster'
Plug 'savq/melange'
Plug 'shaunsingh/moonlight.nvim', {'branch': 'pure-lua'}
Plug 'rebelot/kanagawa.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'folke/tokyonight.nvim'


call plug#end()
