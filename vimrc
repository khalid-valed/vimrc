filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'docteurklein/php-getter-setter.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'preservim/tagbar'
Plugin 'vim-vdebug/vdebug'
Plugin 'tpope/vim-commentary'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdcommenter'
"nerd tree
Plugin 'scrooloose/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'kdheepak/lazygit.nvim'
"Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'diepm/vim-rest-console'

"FZF finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'pbogut/fzf-mru.vim'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'StanAngeloff/php.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/pdv'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nelsyeung/twig.vim'
Plugin 'grvcoelho/vim-javascript-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'hesselbom/vim-hsftp'
Plugin 'gyim/vim-boxdraw'

"Themes
Plugin 'vim-airline/vim-airline'
Plugin 'joshdick/onedark.vim'
Plugin 'doums/darcula'
Plugin 'airblade/vim-gitgutter'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'tomasiser/vim-code-dark'
Plugin 'morhetz/gruvbox'
Plugin 'christophermca/meta5'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""""""""""""""""""""""""COC VIM SETUP""""""""""""""
if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"  -this like destroys tab behavior so be accurate
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current line.
nmap ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


let g:coc_global_extensions = ['coc-emmet', 'coc-phpls', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pairs', 'coc-snippets']


"""""""""""""""""""END OF COC VIM"""""""""""""""""""

let g:NERDTreeDirArrowExpandable = ''

let g:NERDTreeDirArrowCollapsible = ''

" Fuzzy finder
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:70%'  --margin=1,2 --preview 'bat --color=always --style=header,grid  {}'"
let g:fzf_action = { 'enter': 'tab split'  }
let g:fzf_mru_no_sort = 1
let g:fzf_mru_relative = 1

let g:php_cs_fixer_level = "psr4"
let g:vdebug_options = { 'port': '9003', 'host': 'host.docker.internal','ide_key' : 'vim'} 
let g:vdebug_options.path_maps = {"/data/": "."}
"let g:vue_disable_pre_processors=1
"let g:vue_pre_processors = []

let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-s': '',
\}

let g:snipMate = { 'snippet_version' : 1  }

"=========Mappings==========

inoremap jj <Esc>
nmap ss <Esc> :wa<CR>
nmap ff :Format <CR>
nmap <c-b> :NERDTreeToggle<CR>
nmap nr :NERDTreeFind<CR>
"nmap <F1> :noh<CR>
nmap <F2> :noh<CR>
nmap <F5> :Fold <CR>
nmap <F4> :!cat %<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F10> :!gitk %<CR>
" FZF FINDER STUFF
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag <C-R><C-W><Cr>
nnoremap <c-r> :Buffers<Cr>
nnoremap <c-h> :FZFMru<Cr>
nnoremap <c-j> :Ag<Cr>
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

nnoremap <C-f> :Ag <Cr>
"nmap <c-j> yyp:.!bash<CR>
nmap zz :silent !docker exec spryker_b2b_dev_cli_1 vendor/bin/console code:sniff:style -f % <CR>:e % <CR>

autocmd FileType php noremap ff :call PhpCsFixerFixFile()<cr>

"""""""""""""""""""""""""'START GUI SETTINGS'"""""""""""""""""""""""""

let g:coc_disable_startup_warning = 1
set backspace=indent,eol,start "Make backspace behave like other editors"
set number "set numbers for line"
set mouse=a
"set fillchars+=vert:\|
"syntax enable
syntax on
set ruler
set hidden
set laststatus=2
set smartindent
set ignorecase
"set relativenumber
"set st=4 sw=4 et
set shiftwidth=4
set tabstop=8
let &colorcolumn="190"
set cursorline
set noswapfile

"==========Searching========="
set hlsearch
set incsearch
"set ve=all

"=========Visuals=========="
"
 if (has('termguicolors'))
    set termguicolors
 endif

colorscheme gruvbox
set background=dark
let g:airline_theme='monokai_tasty'
"set t_Co=256
set nowrap
hi Normal guibg=NONE ctermbg=NONE

"""""""""""""""""""""""""'END OF GUI SETTINGS'"""""""""""""""""""""""""
nmap vconf :tabedit ~/.config/nvim/init.vim<cr>
nmap zconf :tabedit ~/.zshrc<cr>
au BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

"===========depreacted commands

"autocmd VimEnter * NERDTree
"let g:ctrlp_custom_ignore = 'node_modules\|web\|vendor\|components\|cordova\|var\|git'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_match_window = 'order:ttb,min:1,max:30,results:30'
"let g:ctrlp_cmdpalette_execute = 1
"let g:phpcomplete_add_class_extensions = ['mongo']
"let g:phpcomplete_add_function_extensions = ['mongo']
"nmap fu :Hupload<Cr><Cr>
"imap <F4> :hi Normal guibg=NONE ctermbg=NONE<CR>
":set guioptions-=m "remove menu bar
":set guioptions-=T "remove toolbar
":set guioptions-=r "remove right-hand scroll bar
":set guioptions-=L "remove left-hand scroll bar
":set lines=999 columns=999
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'reedes/vim-wordy'
"let NERDTreeMapOpenInTab='<ENTER>'
"
"
" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

