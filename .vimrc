" lose vi compatibility
set nocompatible

set nomodeline

" enable project-specific vimrc
set exrc

" use ~/.vim for windows too
if (has('win16') || has('win32') || has('win64'))
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif

if !isdirectory($HOME.'/.vim/')
  call mkdir($HOME.'/.vim/')
endif

if !isdirectory($HOME.'/.vim/swap/')
  call mkdir($HOME.'/.vim/swap/')
endif

set directory=$HOME/.vim/swap/

" load the plugins
silent! source $HOME/plugs.vim

" turn on syntax highlighting
let g:python_highlight_all=1
syntax on
let g:Hexokinase_highlighters = ['backgroundfull']

" change to the correct indention and plugins dependent on the file type
filetype on
filetype indent on
filetype plugin on

" unfold everything (looking at you rst)
" set foldlevel=99

" turn on line numbers
set number

" turn on the visual bell
set visualbell
set noerrorbells

" tab settings
set autoindent
set smartindent
set smarttab
set expandtab

set shiftwidth=2
set softtabstop=2
set tabstop=2

" allow for cursor beyond last character.
set virtualedit=onemore

" store more history
set history=1000

" configure wildignore
set wildignore+=*/tmp/*,*.so,*.gz,*.swp,*.bak,*.pyc,*.class
set wildignorecase

" when we turn on set list, we want to see these types of whitespace:
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" smart case-sensitive searching
set ignorecase
set smartcase

" auto-load files changed outside of vim
set autoread

" highlight all search pattern matches
set hlsearch

" configure wildmode completion
set wildmode=longest,list:longest

" set the tags location
set tags+=./.git/tags

" set up file specific settings
augroup file_specific_settings
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
  autocmd BufNewFile,BufRead .sequelizerc set syntax=javascript
  " autocmd FileType rst setlocal shiftwidth=3 tabstop=3
augroup END

" disable automatic commenting
autocmd FileType * setlocal formatoptions-=cro
set formatoptions-=cro

" remap ESC
inoremap <silent> jj <ESC>

" minimize the ESC delay
set timeoutlen=1000
set ttimeoutlen=0

" turn off the arrow keys but provide a nice message
nnoremap <silent> <Left>  :echoe  'Left is "h".'<CR>
nnoremap <silent> <Down>  :echoe  'Down is "j".'<CR>
nnoremap <silent> <Up>    :echoe    'Up is "k".'<CR>
nnoremap <silent> <Right> :echoe 'Right is "l".'<CR>

" turn the arrow keys off in insert mode too
inoremap <Left>  <nop>
inoremap <Down>  <nop>
inoremap <Up>    <nop>
inoremap <Right> <nop>

" readline abilities in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-d> <Del>

" wrapped lines go to next row not next line in file
noremap <silent> j gj
noremap <silent> k gk

" move visual selections up and down
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" quick command mode
nnoremap <space> :

" remap the leader key
let mapleader=','

" use \ to repeat find backwards
nnoremap <silent> \ ,

" change the current working directory to the current file's location
nnoremap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>

" set up extra whitespace detection and stripping
nnoremap <silent> <leader>sw :StripWhitespace<CR>

" indent the whole file and return to the current line
nnoremap <silent> <leader>i gg=G''

" grep the word under the cursor.
nnoremap <silent> <leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" add a fast mapping to the last buffer command
nnoremap <silent> <leader>. <C-^>

" Easy Align keymaps
vmap <silent> <CR> <Plug>(EasyAlign)
nmap <silent> <leader>ea <Plug>(EasyAlign)

" open this file's directory using netrw in a split.
nnoremap <silent> <C-n> :vsplit<CR><C-W><C-W>:edit %:p:h<CR>

" Incremental search settings
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#consistent_n_direction = 1
let g:incsearch#magic = '\v'

" Incremental search mappings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" set up quick searching ag/ack
if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ack')
  " use ack instead of grep
  set grepprg=ack\ --nocolor
  " settings
  let g:ackhighlight=1
endif
" settings
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<space>

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" lsp
lua <<EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "<leader>sp", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
    javascript = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
    }
}

nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  settings = {
    pylsp = {
      configurationSources = {'flake8'},
      plugins = {
        pycodestyle = {enabled = false},
        flake8 = {enabled = true},
        isort = {enabled = true}
        -- jedi = {enabled = true},
        -- jedi_completions = {enabled = true},
        -- jedi_definition = {enabled = true},
        -- jedi_hover = {enabled = true},
        -- jedi_references = {enabled = true},
        -- jedi_signature_help = {enabled = true},
        -- jedi_symbols = {enabled = true},
      }
    }
  }
}

local_servers = { 'pyright', 'tsserver', 'nimls' }
for _, lsp in ipairs(local_servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" deoplete
" let g:deoplete#enable_at_startup = 1
" let g:jedi#completions_enabled = 0

" nvim-compe
set completeopt=menuone


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true
" let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

let g:black_skip_string_normalization = 1
let g:black_linelength = 100
nnoremap <leader>ff :Black<CR>

function! s:RunBlackMacchiato() range
    let cmd = "black-macchiato"
    if !executable(cmd)
        echohl ErrorMsg
        echom "black-macchiato not found!"
        echohl None
        return
    endif

    silent execute a:firstline . "," . a:lastline . "!" . cmd

    echo "Done formatting."

endfunction

if !exists(':BlackMacchiato')
  " Create a command to call the black-macchiato function
  command -range BlackMacchiato <line1>,<line2>call <sid>RunBlackMacchiato()
endif

" Optionally add keyboard shortcuts to call the command in normal and visual modes
autocmd FileType python xnoremap <buffer> <Leader>f :'<,'>BlackMacchiato<cr>
autocmd FileType python nnoremap <buffer> <Leader>f :BlackMacchiato<cr>

" clear highlighting and redraw the screen
nnoremap <silent> <leader>l :redraw!<CR>:nohl<CR><ESC>

" quickly edit .vimrc
nnoremap <silent> <leader>ev :e ~/.vimrc<CR>
nnoremap <silent> <leader>ep  :e ~/plugs.vim<CR>
nnoremap <silent> <leader>esv :vsplit ~/.vimrc<CR>
nnoremap <silent> <leader>esp :vsplit ~/plugs.vim<CR>
nnoremap <silent> <leader>sv  :so $MYVIMRC<CR>:nohl<CR>

" quickly edit .zshrc
nnoremap <silent> <leader>ez :e ~/.zshrc<CR>
nnoremap <silent> <leader>ezv :vsplit ~/.zshrc<CR>

" quickly edit terminal config
nnoremap <silent> <leader>em :e $HOME/.config/alacritty/alacritty.yml<CR>
nnoremap <silent> <leader>esm :vsplit $HOME/.config/alacritty/alacritty.yml<CR>

" quickly edit .tmux.conf

nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>
nnoremap <silent> <leader>etv :vsplit<CR><C-w><C-w>:e ~/.tmux.conf<CR>

" quickly write
nnoremap <silent> <leader>w :write<CR>
nnoremap <silent> <leader>W :SudoWrite<CR>

" shortcuts for moving around split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" shortcuts for opening new split windows
nnoremap <silent> <leader>h :split<CR><C-w><C-w>
nnoremap <silent> <leader>v :vsplit<CR><C-w><C-w>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>Q :q!<CR>

" fugitive shortcuts
nnoremap <silent> <leader>gl :0Glog<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit -v<CR>
nnoremap <silent> <leader>gr :Gread<CR>

" gitgutter shortcuts
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" map Y to yank until EOL
nnoremap Y y$

" tired of hitting F1 accidentally?
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" F7 to toggle between 'paste' and 'nopaste' in insert mode
set pastetoggle=<F7>

" F8 to toggle line numbers and git-gutter
nnoremap <silent> <F8> :set nonumber!<CR>:GitGutterToggle<CR>

" F9 to Toggle list (display unprintable characters)
nnoremap <silent> <F9> :set list!<CR>

" F10 to Toggle highlighting the current line and column.
nnoremap <silent> <F10> :set cursorline!<CR>:set cursorcolumn!<CR>

nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :History<CR>
nnoremap <C-c> :History:<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fr :Rg<CR>
let g:ranger_map_keys = 0
nnoremap <silent> <leader>nt :Ranger<CR>

" JavaScript
let g:javascript_plugin_jsdoc = 1
nnoremap <silent> <leader>fj :%!python -m json.tool<CR>

" GitGutter Settings
let g:gitgutter_map_keys = 0
set updatetime=100

set tags=tags;/

" " ALE settings
" nmap <silent> <leader>k <Plug>(ale_previous_wrap)
" nmap <silent> <leader>j <Plug>(ale_next_wrap)
" let g:ale_fixers = {
"       \ 'typescript': ['prettier'],
"       \ 'tsx': ['prettier'],
"       \ 'jsx': ['prettier'],
"       \ 'javascript': ['prettier'],
"       \ 'css': ['prettier'],
"       \ 'html': ['prettier'],
"       \ 'vue': ['prettier'],
"       \}
" let g:ale_fix_on_save = 1
" Copy mappings from vim-jedi for ALE
" nnoremap <leader>g :ALEGoToDefinition<CR>
" nnoremap <leader>n :ALEFindReferences<CR>
" let g:ale_echo_msg_format='[%linter%] %s [%severity%]'

" Python
nnoremap <silent> <leader>bp <Esc>obreakpoint()<Esc>
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nmap <silent> <C-i> <Plug>(pydocstring)
let g:pyindent_open_paren = 'shiftwidth()'

" Rust
let g:rustfmt_autosave = 1

" Clojure
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" use a dark background
set background=dark

" startify
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = startify#fortune#boxed()
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [{'v': '~/.vimrc'}, {'z': '~/.zshrc'}, {'p': '~/plugs.vim'}, {'m': '~/.config/alacritty/alacritty.yml'}]

" make the GUI nice
if has('gui_running')
  " turn off the menu, tool, and scroll bar
  set guioptions-=m
  set guioptions-=T
  set guioptions-=L
  set guioptions-=l
  set guioptions-=r
  set guioptions-=R

  " increase the starting size of the editor
  set lines=50
  set columns=140

  " default to line and column highlighting
  set cursorline cursorcolumn
endif

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

let g:candid_color_store = {
  \ "black": {"gui": "#20242c", "cterm256": "0"},
  \}
let g:gruvbox_contrast_light = "soft"

set termguicolors
" load palenight so I can use palenight airline theme
colorscheme palenight
colorscheme moonlight
let g:airline_powerline_fonts = 1
let g:airline_theme = 'palenight'

" load a personal vimrc if one exists
let s:personalrc = expand($HOME . '/.personal.vimrc')
if filereadable(s:personalrc)
  exec ':so ' . s:personalrc
endif

" prevent dangerous commands in project-specific vimrc
set secure
