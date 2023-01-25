" lose vi compatibility
set nocompatible

set nomodeline

set undofile

set mouse=a

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
let g:EditorConfig_preserve_formatoptions = 1
augroup file_specific_settings
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
  autocmd FileType python setlocal formatoptions-=t
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

let g:nnn#session = 'local'

" Hop
nnoremap <silent> <leader><leader>w <cmd>HopWord<CR>
nnoremap <silent> <leader><leader>b <cmd>HopWord<CR>
nnoremap <silent> <leader><leader>f <cmd>HopChar1<CR>
nnoremap <silent> <leader><leader>a <cmd>HopAnywhere<CR>
vnoremap <silent> <leader><leader>w <cmd>HopWord<CR>
vnoremap <silent> <leader><leader>b <cmd>HopWord<CR>
vnoremap <silent> <leader><leader>f <cmd>HopChar1<CR>
vnoremap <silent> <leader><leader>a <cmd>HopAnywhere<CR>

" Tests
nnoremap <silent> <leader>tr :TestLast<CR>
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tc :TestClass<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tp :TestNearest --pdb<CR>

" Trouble
nnoremap <silent> <leader>dd :Trouble document_diagnostics<CR>
nnoremap <silent> <leader>dr :Trouble lsp_references<CR>
nnoremap <silent> <leader>dc :TodoTrouble<CR>
nnoremap <silent> <leader>dq :TroubleClose<CR>

" ZenMode
nnoremap <silent> <leader>z :ZenMode<CR>

" firenvim settings
if exists('g:started_by_firenvim')
  tmap <D-v> <C-w>"+
  nnoremap <D-v> "+p
  vnoremap <D-v> "+p
  inoremap <D-v> <C-R><C-O>+
  cnoremap <D-v> <C-R><C-O>+
endif

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

" Code outline
nnoremap <F5> :AerialToggle<cr>

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
require('lualine').setup({
  sections = {
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
  },
})
local nvim_lsp = require('lspconfig')
local aerial = require('aerial')
aerial.setup({})
require('gitsigns').setup({})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for kind, sign in pairs(signs) do
  local name = 'DiagnosticSign' .. kind
  vim.fn.sign_define(name, { texthl = name, text = sign, numhl = name })
end
require('zen-mode').setup({})
require('dap-python').setup('~/.local/share/venvs/debugpy/bin/python')


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "<leader>sp", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- completions
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'emoji' },
  }, {
    { name = 'buffer' },
  })
})

-- There is some sort of buggy interaction with which-key here
-- cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
-- })

-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
    javascript = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", ".eslintrc.json", "package.json"},
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
    capabilities = capabilities,
    init_options = {
        filetypes = filetypes,
        linters = linters,
    }
}

nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      configurationSources = {'flake8'},
      plugins = {
        pycodestyle = {enabled = false},
        flake8 = {enabled = true},
        isort = {enabled = true},
        jedi_references = {enabled = false},
      }
    }
  }
}

require('rust-tools').setup({
  server = {
    on_attach = on_attach,
  },
  capabilities = capabilities,
})

local_servers = { 'pyright', 'tsserver', 'nimls' }
for _, lsp in ipairs(local_servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require("trouble").setup {
  mode = "document_diagnostics"
}

require("todo-comments").setup()

require("which-key").setup()

require("hop").setup()
EOF

" nvim-cmp
set completeopt=menu,menuone

" snippets
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

let g:black_skip_string_normalization = 1
let g:black_linelength = 100

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
autocmd FileType python xnoremap <buffer> <Leader>ff :'<,'>BlackMacchiato<cr>
autocmd FileType python nnoremap <buffer> <Leader>ff :BlackMacchiato<cr>

autocmd FileType xml xnoremap <buffer> <Leader>ff :%!xmllint --format %<cr>
autocmd FileType xml nnoremap <buffer> <Leader>ff :%!xmllint --format %<cr>

autocmd FileType terraform setlocal commentstring=#\ %s

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

" terminal mappings
tnoremap <Esc> <C-\><C-n>

" fugitive shortcuts
nnoremap <silent> <leader>gl :0Gclog<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gs :G status<CR>
nnoremap <silent> <leader>gc :G commit -v<CR>
nnoremap <silent> <leader>gr :Gread<CR>

" gitgutter shortcuts
nmap ]h :Gitsigns next_hunk<CR>
nmap [h :Gitsigns prev_hunk<CR>
nnoremap <silent> <leader>th :Gitsigns setqflist<CR>

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
nnoremap <silent> <leader>fc :Commands<CR>

" JavaScript
let g:javascript_plugin_jsdoc = 1

" GitGutter Settings
let g:gitgutter_map_keys = 0
set updatetime=100

set tags=tags;/

" Python
nnoremap <silent> <leader>bp <Esc>obreakpoint()<Esc>
" autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
let g:pyindent_open_paren = 'shiftwidth()'

" Rust
let g:rustfmt_autosave = 1

" Clojure
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" startify
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = []
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
  ensure_installed = {
    'bash',
    'c',
    'clojure',
    'cmake',
    'comment',
    'cpp',
    'css',
    'dockerfile',
    'go',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'latex',
    'lua',
    'make',
    'prisma',
    'python',
    'regex',
    'rst',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
    'zig',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

let g:user_emmet_settings = {
\ 'typescript': {
\   'extends': 'jsx',
\ }
\}

let g:candid_color_store = {
  \ "black": {"gui": "#20242c", "cterm256": "0"},
  \}
let g:gruvbox_contrast_light = "soft"
let g:mellow_italic_keywords = 1
lua <<EOF
-- Make diagnostics less harsh
require('kanagawa').setup({ colors = { samuraiRed = '#FF5D62' } })
EOF

" use a dark background
set background=dark

set termguicolors
colorscheme kanagawa

" load a personal vimrc if one exists
let s:personalrc = expand($HOME . '/.personal.vimrc')
if filereadable(s:personalrc)
  exec ':so ' . s:personalrc
endif

" prevent dangerous commands in project-specific vimrc
set secure
