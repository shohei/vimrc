set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
let $LANG = "en"
let &t_Co=256
syntax on
set number
set laststatus=2
set ignorecase
set cindent
colorscheme railscasts 
syntax enable
hi Normal ctermfg=none ctermbg=none
set hlsearch
set autoindent
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set lazyredraw
set tabstop=4 expandtab shiftwidth=4 softtabstop=4
"set tabstop=1 expandtab shiftwidth=1 softtabstop=1
"source ~/.vim/plugin/matchit.vim
"for moving tab in NerdTree
nnoremap <C-n> gt
nnoremap <C-p> gT
" map <Cmd-s> :w<kEnter>  "Works in normal mode, must press Esc first"
" imap <Cmd-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
"imap <C-j> <esc>
inoremap <C-j> <esc>
nnoremap <silent> <C-s> :s
"nnoremap ; : "wanna use ; for forwarding 
nnoremap a :a!<kEnter>
"vnoremap t :MakeMultilineTableFromGridTable<kEnter>
"command GenerateTable s/[|+]/ /g

execute pathogen#infect()
" * evervim {{{
	nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
	nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
	nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
	nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
	nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
	nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
	nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
	nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
	let g:evervim_splitoption=''
" ------------------------ }}}

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
filetype plugin indent on     
" Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle "sudar/vim-arduino-syntax"
NeoBundle "armyofevilrobots/vim-openscad"
NeoBundle "shohei/vim-eagle-ulp"
NeoBundle "shohei/vim-eagle-cam"
NeoBundle "shohei/vim-eagle-scr"
NeoBundle 'fatih/vim-go'
NeoBundle 'sbl/scvim'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'
" set statusline=2
"let g:Powerline_symbols = 'compatible'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'
let g:Powerline_symbols = 'fancy'

NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'oplatek/Conque-shell'
NeoBundle 'dhruvasagar/vim-table-mode'
let g:table_mode_always_active=1
let g:table_mode_corner_corner='|'
"let g:table_mode_separator='+'
vnoremap t :s/[\|+]/ /g<kEnter>
vnoremap m :s/+-/ /g \| '<,'>:s/\|//g \| '<,'>:s/^.//g <kEnter>
command MakeMultilineTableFromGridTable :'<,'>s/[|+]/ /g

NeoBundle 'supermomonga/shaberu.vim'
NeoBundle 'derekwyatt/vim-scala'

NeoBundle 'tpope/vim-markdown'
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1
NeoBundle "git://github.com/osyo-manga/unite-quickrun_config.git"

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:calendar_google_calendar = 1

let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 0

let g:quickrun_config = {}
let g:quickrun_config = {
            \   "_" : {
            \       "outputter/buffer/split" : ":botright 8sp",
            \   }
            \}
 let g:quickrun_config.tex = {
             \ 'outputter' : 'error',
             \ 'command'   : 'p',
             \ 'outputter/error/error' : 'quickfix',
             \ 'exec'      : ['%c'],
             \ }
"let g:quickrun_config={'*': {'split': ''}}
"set splitbelow
let g:quickrun_config.processing =  {
      \     'command': 'processing-java',
      \     'exec': '%c --sketch=$PWD/ --output=/Users/shohei/Library/Processing/Executable --run --force',
      \}
let g:quickrun_config['html'] = {
            \ 'outputter' : 'null',
            \ 'command'   : 'open',
            \ 'exec'      : ['%c %s'],
            \ }
" let g:quickrun_config.markdown = {
"       \ 'outputter' : 'error',
"       \ 'command'   : 'open',
"       \ 'cmdopt'    : '-a',
"       \ 'args'      : '/Applications/Marked\ 2.app/Contents/MacOS/Marked \2',
"       \ 'exec'      : ['%c %o %a %s'],
"       \ }

"NeoBundle 'itchyny/landscape.vim'
"  colorscheme landscape
"  let g:Powerline_theme = 'landscape'
"  let g:Powerline_colorscheme = 'landscape'
"  let g:airline_theme = 'landscape'
"
"NeoBundle 'bling/vim-airline'
"  let g:airline_enable_branch = 0
"  let g:airline_section_b = "%t %M"
"  let g:airline_section_c = ''
"  let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
"  let g:airline_section_x =
"        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
"        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
"        \ "%{strlen(&filetype)?&filetype:'no ft'}"
"  let g:airline_section_y = '%3p%%'
"  let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
"  let g:airline#extensions#whitespace#enabled = 0
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" NeoBundle 'itchyny/lightline.vim'
"
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"⭤":""}',
"       \ },
"       \ 'separator': { 'left': '⮀', 'right': '⮂' },
"       \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"       \ }

" lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"\u2b64":""}',
"       \ },
"       \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"       \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
"       \ }

let g:syntastic_mode_map = { 'mode': 'passive' }

NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
""
"" Vim-LaTeX
""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 0
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = '/usr/texbin/ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'
let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/bibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/bibtexu'
let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
"let g:Tex_MakeIndexFlavor = '/usr/texbin/makeindex $*.idx'
"let g:Tex_MakeIndexFlavor = '/usr/texbin/texindy $*.idx'
let g:Tex_SmartKeyQuote = 0
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = '/usr/bin/open'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXworks.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Firefox.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'

" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

exe "set runtimepath+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

command Prettify :%s/></>\r</g | filetype indent on | setf xml | normal gg=G 
"command -nargs=? U call Unitizer(<f-args>)
"function Unitizer(...)
"    exec("Unite ". a:1 )
"endfunction


command -nargs=? C call GitCommit(<f-args>)
function GitCommit(...)
 if a:0 >= 1
    let commitmsg = "\"" . a:1 ."\""
    let currentDir = "\"". expand("%:h")."\""
    let currentAbsDir= system("pwd") 
    let syscom = "git add \-A " .currentDir. " \&\&  git commit \-m ".commitmsg
    "let debugcom = syscom . "\&\& echo \"Committed with comment\: \"" . commitmsg ." \|\| echo \"Commit FAILED\"\."
    "let debugcom2 = syscom . "\&\& say success\|\| say failed "
    let debugcom3 = syscom . "\&\& sed \-i \-e \"s\/gitsuccess\=./gitsuccess\=1/\" \~\/\.zshrc \|\| sed \-i \-e \"s\/gitsuccess\=.\/gitsuccess\=2\/\" \~\/\.zshrc \; source \~\/\.zshrc"
    "echo commitmsg
    "echo debugcom3 
    call system(debugcom3)

    let gsuccess = $gitsuccess
    if gsuccess==1
        echo "Committed done with message: " .commitmsg
    elseif gsuccess==2
        echo "Git commit failed."
    else
        echo gsuccess
        echo "Hey, something weird happened."
    endif
 else
   echo "Commit message should be specified!"
 end
endfunction


" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'vim-scripts/applescript.vim'
set imdisable

set clipboard=unnamed
set mouse=a
set spell
hi clear SpellBad
hi SpellBad cterm=underline
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
set cursorline


"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace //
    augroup END
    call ZenkakuSpace()
endif

set backupskip=/tmp/*,/private/tmp/*
if has('lua') 
    set spelllang=en,cjk 
endif

" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
"

" NeocompleteとNeosnippetsがコンフリクトしてるようなので
" Neocompleteは消しとく
" if_luaが有効ならneocompleteを使う
" NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
" if neobundle#is_installed('neocomplete')
"     " neocomplete用設定
"     let g:neocomplete#enable_at_startup = 1
"     let g:neocomplete#enable_ignore_case = 1
"     let g:neocomplete#enable_smart_case = 1
"     if !exists('g:neocomplete#keyword_patterns')
"         let g:neocomplete#keyword_patterns = {}
"     endif
"     let g:neocomplete#keyword_patterns._ = '\h\w*'
" elseif neobundle#is_installed('neocomplcache')
"     " neocomplcache用設定
"     let g:neocomplcache_enable_at_startup = 1
"     let g:neocomplcache_enable_ignore_case = 1
"     let g:neocomplcache_enable_smart_case = 1
"     if !exists('g:neocomplcache_keyword_patterns')
"         let g:neocomplcache_keyword_patterns = {}
"     endif
"     let g:neocomplcache_keyword_patterns._ = '\h\w*'
"     let g:neocomplcache_enable_camel_case_completion = 1
"     let g:neocomplcache_enable_underbar_completion = 1
" endif
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"
"
" syntax match luaTodo /^.*WIP.*$/ contained
" highlight texTodo ctermbg=Yellow ctermfg=Red
" syn match texTodo   contained   "\<\(TODO\|FIXME\):"
" hi def link texTodo Todo
"syntax on
" highlight texTodo ctermbg=Yellow ctermfg=Red
" syn match texTodo   contained   "\<\(TODO\|FIXME\):"
" hi def link texTodo Todo

" for drcs file type detect, not working...
" Vimであいまいな幅の文字の論理幅を1にします
" set ambiwidth=single
" " RLoginであいまいな幅の文字の論理幅を1にします。
" call writefile(["\e[?8428h"], '/dev/tty')

