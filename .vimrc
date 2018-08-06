filetype indent on
filetype plugin on 
filetype plugin indent on
syntax on
syntax enable
set modeline
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent
set foldmethod=syntax
set background=dark
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set cmdheight=2
set mouse=a
set undofile 
set relativenumber
set number 
set undodir=~/.vim/undodir
highlight LineNr ctermfg=grey 
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <space> za
vnoremap <space> zf
nnoremap <esc><esc> :silent! nohls<cr>
autocmd FileType cpp nmap <buffer> <F9> :w<bar>!g++ -o %:r % && ./%:r<CR>
autocmd FileType python nmap <buffer> <F5> :exec '!python3' shellescape(@%,1)<CR>
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.* mkview!
  autocmd BufWinEnter *.* silent loadview
augroup END
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
execute pathogen#infect()
call pathogen#helptags()
let python_highlight_all=1
nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'css': [ 're!^\s{4}', 're!:\s+' ],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.']
            \ }
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
" git gutter update time 
" You can jump between hunks with [c and ]c. You can preview, stage, and undo hunks with <leader>hp, <leader>hs, and <leader>hu respectively.
set updatetime=100
"comfortable scrolling for the smooth scrolling effect 
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 0.1
let NERDTreeMapOpenInTab='\r'
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(20)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-20)<CR>
nnoremap <silent> <ScrollWheelDown>  :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <ScrollWheelUp>  :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
" nerd tree configs
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree
"django template highlighting
au BufNewFile,BufRead *.html set filetype=htmldjango
