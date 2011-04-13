" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif
set nocompatible
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select =  0 
	inoremap <expr><CR>  (pumvisible() ? "\<C-e>":'') . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
	inoremap <expr><C-h> pumvisible() ? neocomplcache#cancel_popup()."\<C-h>" : "\<C-h>"
	inoremap <expr><BS> pumvisible() ? neocomplcache#cancel_popup()."\<C-h>" : "\<C-h>"
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"Encoding settings
if has("multi_byte")
    " Set fileencoding priority
   if getfsize(expand("%")) > 0
       set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
   else
       set fileencodings=cp936,big5,euc-jp,euc-kr,latin1
   endif
    " CJK environment detection and corresponding setting
   if v:lang =~ "^zh_CN"
        " Use cp936 to support GBK, euc-cn == gb2312
       set encoding=cp936
       set termencoding=cp936
       set fileencoding=cp936
   elseif v:lang =~ "^zh_TW"
        " cp950, big5 or euc-tw
        " Are they equal to each other?
       set encoding=big5
       set termencoding=big5
       set fileencoding=big5
   elseif v:lang =~ "^ko"
        " Copied from someone's dotfile, untested
       set encoding=euc-kr
       set termencoding=euc-kr
       set fileencoding=euc-kr
   elseif v:lang =~ "^ja_JP"
        " Copied from someone's dotfile, unteste
       set encoding=euc-jp
       set termencoding=euc-jp
       set fileencoding=euc-jp
   endif
    " Detect UTF-8 locale, and replace CJK setting if needed
   if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
       set encoding=utf-8
       set termencoding=utf-8
       set fileencoding=utf-8
   endif
else
   echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif
"cscope
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif
set csverb
set cscopetag
set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif


autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete


"let g:neomplcache_enable_auto_select = 1
"sable AutoComplPop. 
let g:acp_enableAtStartup = 0 
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'




"mni completion. 
if !exists('g:neocomplcache_omni_patterns') 
let g:neocomplcache_omni_patterns = {} 
endif 
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
set nocompatible
set autoindent
set smartindent
set columns=80
set tabstop=4
set ruler
set noexpandtab
set number
set ignorecase
set wrapmargin=15
set cindent
set shiftwidth=4
set showmatch 
set formatoptions=tcrqn  
