" -*- mode: vim -*-
" vim: set expandtab tabstop=4 shiftwidth=4 foldmethod=indent:

" Bundle {
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#rc()
        Plugin 'VundleVim/Vundle.vim'
        Plugin 'gmarik/vundle'
        Plugin 'godlygeek/tabular'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'bronson/vim-trailing-whitespace'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'scrooloose/syntastic'
        Plugin 'ervandew/supertab'
        Plugin 'mattn/webapi-vim'
        Plugin 'mattn/gist-vim'
        Plugin 'Lokaltog/vim-powerline'
        Plugin 'tpope/vim-fugitive'
        Plugin 'scrooloose/nerdtree'
        Plugin 'humiaozuzu/TabBar'
        Plugin 'majutsushi/tagbar'
        Plugin 'Yggdroot/indentLine'
        "Plugin 'SirVer/ultisnips'
        Plugin 'vim-scripts/matchit.zip'
        Plugin 'gregsexton/MatchTag'
        Plugin 'tpope/vim-surround'
        Plugin 'dgryski/vim-godef'
        Plugin 'Blackrush/vim-gocode'
        Plugin 'fatih/vim-go'
        Plugin 'ianva/vim-youdao-translater'
        Plugin 'vimcn/vimcdoc'
        Plugin 'mbbill/undotree'
        Plugin 'kshenoy/vim-signature'
        Plugin 'Lokaltog/vim-easymotion'
        Plugin 'sjl/gundo.vim'
        Plugin 'dyng/ctrlsf.vim'
        Plugin 'kien/ctrlp.vim'
        Plugin 'tacahiroy/ctrlp-funky'
        Plugin 'terryma/vim-multiple-cursors'
        Plugin 'suan/vim-instant-markdown'
        Plugin 'iamcco/markdown-preview.vim'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'ervandew/screen'
        Plugin 'mileszs/ack.vim'
        "Plugin 'Shougo/vimshell.vim'
        "Plugin 'Shougo/vimproc'
    call vundle#end()
" }


" General {
    set nobackup                    " Without backup file
    set noswapfile                  " Without swap file
    set background=dark             " Assume a dark background
    colorscheme solarized           " Set colorscheme solarized
    filetype plugin indent on       " Automatically detect file types.
    syntax on                       " Syntax highlighting
    set mouse=a                     " Automatically enable mouse usage
    set mousehide                   " Hide the mouse cursor while typing
    set history=1000                " Store a ton of history (default is 20)
    set virtualedit=onemore         " Allow for cursor beyond last character
    "set spell                       " Spell checking on
    set encoding=utf-8              " Encoding
                                    " Fileencodings
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
                                    " Always switch to the current file directory
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" }


" Vim UI {
    set number                      " Line numbers on
    set relativenumber              " Line relative number on
    set cursorline                  " Highlight current line
    "set cursorcolumn                " Highlight current column
    "set showmatch                   " Show matching brackets/parenthesis
    set showmode                    " Display the current mode
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=1                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
" }


" Formatting {
    set backspace=2                 " Make backspace work like most other apps
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    "set splitright                  " Puts new vsplit windows to the right of the current
    "set splitbelow                  " Puts new split windows to the bottom of the current
    "autocmd                         " Remove trailing whitespaces and ^M chars
    "    \ FileType c,cpp,go,python
    "    \ autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" }


" Key (re)Mappings {
    let mapleader=','

    " Go to next buffer in buffer list
    noremap <F1> :bp<CR>

    " Go to next buffer in buffer list
    noremap <F2> :bn<CR>

    " ScreenSend
    noremap <F3> :. ScreenSend<cr>

    " UndotreeToggle
    noremap <F4> :UndotreeToggle<cr>

    " Tagbar Toggle
    nmap <F5> :TagbarToggle<cr>

    " NERDTree Toggle
    nmap <F6> :NERDTreeToggle<cr>

    " pastetoggle (sane indentation on pastes)
    set pastetoggle=<F9>

    " Delete buffer
    noremap <leader>bw :bw<CR>

    " Write the whole buffer to the current file
    noremap <leader>w :w<CR>

    " Write all changed buffers and quit the current window
    noremap <leader>wq :wa<CR>:q<CR>

    " Exit Vim, unless there are some buffers which have been changed
    noremap <leader>q :qa!<CR>

    " Search forward using very magic mode
    nnoremap <leader>/ /\v

    " Search backward using very magic mode
    nnoremap <leader>? ?\v

    " Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Change Working Directory to that of the current file
    cnoremap cwd lcd %:p:h
    cnoremap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    vnoremap . :normal .<CR>

    " Copy and paste
    vnoremap <leader>tee :!tee /tmp/t<CR>
    vnoremap <leader>cat :!cat /tmp/t<CR>

    " ScreenShell open and quit
    noremap <leader>ss :ScreenShell<cr>
    noremap <leader>sq :ScreenQuit<cr>
" }


" Plugins {
    " colorscheme {
        let g:solarized_termtrans = 1
    " }

    " syntastic {
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    " }

    " supertab {
        let g:SuperTabRetainCompletionType = 2
        let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
    " }

    " YouCompleteMe {
        set completeopt-=preview
        inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
        let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
        let g:ycm_complete_in_comments = 1
        let g:ycm_complete_in_strings = 1
        let g:ycm_enable_diagnostic_signs = 0
        let g:ycm_seed_identifiers_with_syntax= 1
        "let g:ycm_server_use_vim_stdout = 1
        "let g:ycm_server_log_level = 'debug'
    " }

    " vim-powerline {
        set laststatus=2
        set noshowmode
    " }

    " TabBar {
        let g:Tb_MaxSize = 2
        let g:Tb_TabWrap = 1
    " }

    " ultisnips {
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        let g:UltiSnipsSnippetDirectories = ["snippets", "bundle/ultisnips/UltiSnips"]
    " }

    " tagbar {
        set tags=tags;/
        let g:tagbar_left = 1
        let g:tagbar_width = 30
        let g:tagbar_autofocus = 1
        let g:tagbar_sort = 0
        let g:tagbar_compact = 1
        let g:indentLine_color_term = 239
        let g:indentLine_char = '|'

        "let g:tagbar_type_lua = {
        "    \ 'ctagstype' : 'lua',
        "    \ 'kinds' : [
        "        \ 'f:functions',
        "        \ 'v:variables',
        "    \ ],
        "\ }

        if executable('coffeetags')
            let g:tagbar_type_coffee = {
                \ 'ctagsbin' : 'coffeetags',
                \ 'ctagsargs' : '',
                \ 'kinds' : [
                \ 'f:functions',
                \ 'o:object',
                \ ],
                \ 'sro' : ".",
                \ 'kind2scope' : {
                \ 'f' : 'object',
                \ 'o' : 'object',
                \ }
            \ }
        endif

        let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'sort' : 0,
            \ 'kinds' : [
                \ 'h:sections'
            \ ]
        \ }

        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
        \ }
    " }

    " nerdtree {
        let g:indentLine_char = '|'
        let NERDChristmasTree = 0
        let NERDTreeWinSize = 30
        let NERDTreeChDirMode = 2
        let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$']
        let NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
        let NERDTreeShowBookmarks = 1
        let NERDTreeWinPos = "right"
    " }

    " vim-signature {
        if isdirectory(expand("~/.vim/bundle/vim-signature"))
            nnoremap [0 :call signature#marker#Goto('prev', 0, v:count)<CR>
            nnoremap ]0 :call signature#marker#Goto('next', 0, v:count)<CR>
            nnoremap [1 :call signature#marker#Goto('prev', 1, v:count)<CR>
            nnoremap ]1 :call signature#marker#Goto('next', 1, v:count)<CR>
            nnoremap [2 :call signature#marker#Goto('prev', 2, v:count)<CR>
            nnoremap ]2 :call signature#marker#Goto('next', 2, v:count)<CR>
            nnoremap [3 :call signature#marker#Goto('prev', 3, v:count)<CR>
            nnoremap ]3 :call signature#marker#Goto('next', 3, v:count)<CR>
            nnoremap [4 :call signature#marker#Goto('prev', 4, v:count)<CR>
            nnoremap ]4 :call signature#marker#Goto('next', 4, v:count)<CR>
            nnoremap [5 :call signature#marker#Goto('prev', 5, v:count)<CR>
            nnoremap ]5 :call signature#marker#Goto('next', 5, v:count)<CR>
            nnoremap [6 :call signature#marker#Goto('prev', 6, v:count)<CR>
            nnoremap ]6 :call signature#marker#Goto('next', 6, v:count)<CR>
            nnoremap [7 :call signature#marker#Goto('prev', 7, v:count)<CR>
            nnoremap ]7 :call signature#marker#Goto('next', 7, v:count)<CR>
            nnoremap [8 :call signature#marker#Goto('prev', 8, v:count)<CR>
            nnoremap ]8 :call signature#marker#Goto('next', 8, v:count)<CR>
            nnoremap [9 :call signature#marker#Goto('prev', 9, v:count)<CR>
            nnoremap ]9 :call signature#marker#Goto('next', 9, v:count)<CR>
        endif
    " }

    " vim-fugitive {
        if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
            nnoremap <silent> <leader>gst :Gstatus<CR>
            nnoremap <silent> <leader>gd  :Gdiff<CR>
            nnoremap <silent> <leader>gbl :Gblame<CR>
        endif
    "}

    " vim-gitgutter {
        set updatetime=750                " Delay
        let gitgutter_highlight_lines = 1 " To turn on line highlighting by default
    " }

    " tabular {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nnoremap <Leader>a& :Tabularize /&<CR>
            nnoremap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nnoremap <Leader>a=> :Tabularize /=><CR>
            nnoremap <Leader>a: :Tabularize /^[^:]*\zs:<CR>
            nnoremap <Leader>a:: :Tabularize /^[^:]*:\zs<CR>
            nnoremap <Leader>a, :Tabularize /,<CR>
            nnoremap <Leader>a,, :Tabularize /,\zs<CR>
            nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
            nnoremap <Leader>a{ :Tabularize /{<CR>
            nnoremap <Leader>a} :Tabularize /}<CR>
            vnoremap <Leader>a& :Tabularize /&<CR>
            vnoremap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vnoremap <Leader>a=> :Tabularize /=><CR>
            nnoremap <Leader>a: :Tabularize /^[^:]*\zs:<CR>
            nnoremap <Leader>a:: :Tabularize /^[^:]*:\zs<CR>
            vnoremap <Leader>a, :Tabularize /,<CR>
            vnoremap <Leader>a,, :Tabularize /,\zs<CR>
            vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vnoremap <Leader>a{ :Tabularize /{<CR>
            vnoremap <Leader>a} :Tabularize /}<CR>
        endif
    " }

    " undotree {
        if isdirectory(expand("~/.vim/bundle/undotree"))
        endif
    "}

    " screen {
    " }
" }


" Functions {
    " Strip whitespace {
        function! StripTrailingWhitespace()
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endfunction
    " }
" }
