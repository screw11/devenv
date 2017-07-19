set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set bdir=c:\vim_backup

"---- ST lab setting
"function InsertTabWrapper() 
"      let col = col('.') - 1 
"      if !col || getline('.')[col - 1] !~ '\k' 
"          return "\<tab>" 
"      else 
"          return "\<c-p>" 
"      endif 
"endfunction 
"
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "if &sh =~ '\<cmd'    " Workaround for gvim74 bug. This line(single quotes) is actually correct.
  if &sh =~ "\<cmd"
    silent execute '!""C:\Program Files (x86)\Vim\vim74\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
  else
    silent execute '!C:\Program" Files (x86)\Vim\vim74\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  endif
endfunction


set ts=4
set sw=4
set sts=4
set noet
"set expandtab
set lines=44 columns=120
autocmd FileType make setlocal noexpandtab "Makefile에서는 tab사용
set foldmethod=marker
set tags=./tags,tags
set tags+=../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,../../../../../../../tags


" encoding
set fileformat=unix
set fencs=utf-8,cp949,euc-kr
set enc=cp949


:colorscheme torte
:se nu


map <F1> K 
map <F2> :w!<CR> 

map <F3> :NERDTreeToggle<CR>
map <F4> :TlistToggle<CR>
map <F5> :BufExplorer<CR>
map <F6> <C-@>
"w 
" 소스코드 코딩/분석에 도움이 되는 기능 
map <F7> <C-\>
map <F8> [i 
map <F9> gd 
map <F10> '' 
" ctags
map <F11>  
map <F12>  

map <MiddleMouse> <ESC> 
map! <MiddleMouse> <ESC>l 

nnoremap <leader>gr :grep <cword> ./* <CR>:cw<CR>


"------------------------------------
" additional settings

fun! VundleLoaded(bname)
	return exists("g:bundles") && string(g:bundles) =~ a:bname
endfun


" Vundle/Bundle Plugin {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIMRUNTIME/../vimfiles/bundle/vundle
call vundle#rc('$VIMRUNTIME/../vimfiles/bundle')
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" scripts not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" --- end of original vundle configurations

" additional plugins
" Lib for FuzzyFinder
Bundle 'L9'
" file navigation
Bundle 'FuzzyFinder'
" using tab to select sth in fuzzy finder and autocomplpop 
Bundle 'SuperTab'
Bundle 'SuperTab-continued.'
" file tree,, :NERDTreeToggle<F3>
Bundle 'The-NERD-tree'
" toggle comment for visual-lines,, type '\c ' (space!)
Bundle 'The-NERD-Commenter'
" Align assignments,, visual-lines, :Align = 
Bundle 'Align'
" symbol list,, :Tlist, :TlistToggle<F4>, :TlistSync
Bundle 'taglist.vim'
" C/C++ completion by ctags
Bundle 'OmniCppComplete'
" auto popup recommends while typing
Bundle 'AutoComplPop'
" history buffer,, :BufExplorer<F5>
Bundle 'bufexplorer.zip'
" Doxygen template,, :Dox, DoxAuthor, DoxBlock
Bundle 'DoxygenToolkit.vim'
" EasyGrep : need to install
"Bundle 'easygrep.vim'

" make cscope db and add it, db is located at ~\.cscope.vim\
" :CscopeGen [path_to_the_folder]
" :CscopeClear
" :CscopeList
" type '\fs' '\fg' '\fd' '\fc' ... '\l'
" Usage {{{
"" s: Find this C symbol 
""map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR> 
"" g: Find this definition 
"map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR> 
"" d: Find functions called by this function 
"map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR> 
"" c: Find functions calling this function 
"map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR> 
"" t: Find this text string 
"map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR> 
"" e: Find this egrep pattern 
"map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR> 
"" f: Find this file 
"map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR> 
"" i: Find files #including this file 
"map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR> 
"map <leader>l :call ToggleLocationList()<CR> 
" }}}
Bundle 'cscope.vim'

" for normal cscope.out
" Usage {{{
    """""""""""""" My cscope/vim key mappings
    ""
    "" The following maps all invoke one of the following cscope search types:
    ""
    ""   's'   symbol: find all references to the token under cursor
    ""   'g'   global: find global definition(s) of the token under cursor
    ""   'c'   calls:  find all calls to the function name under cursor
    ""   't'   text:   find all instances of the text under cursor
    ""   'e'   egrep:  egrep search for the word under cursor
    ""   'f'   file:   open the filename under cursor
    ""   'i'   includes: find files that include the filename under cursor
    ""   'd'   called: find functions that function under cursor calls
    ""
    "" Below are three sets of the maps: one set that just jumps to your
    "" search result, one that splits the existing vim window horizontally and
    "" diplays your search result in the new window, and one that does the same
    "" thing, but does a vertical split instead (vim 6 only).
    ""
    "" I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    "" unlikely that you need their default mappings (CTRL-\'s default use is
    "" as part of CTRL-\ CTRL-N typemap, which basically just does the same
    "" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    "" If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    "" of these maps to use other keys.  One likely candidate is 'CTRL-_'
    "" (which also maps to CTRL-/, which is easier to type).  By default it is
    "" used to switch between Hebrew and English keyboard mode.
    ""
    "" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    "" that searches over '#include <time.h>" return only references to
    "" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    "" files that contain 'time.h' as part of their name).


    "" To do the first type of search, hit 'CTRL-\', followed by one of the
    "" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    "" search will be displayed in the current window.  You can use CTRL-T to
    "" go back to where you were before the search.  
    ""

    "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    "" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    "" makes the vim window split horizontally, with search result displayed in
    "" the new window.
    ""
    "" (Note: earlier versions of vim may not have the :scs command, but it
    "" can be simulated roughly via:
    ""    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    "nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    "" Hitting CTRL-space *twice* before the search type does a vertical 
    "" split instead of a horizontal one (vim 6 and up only)
    ""
    "" (Note: you may wish to put a 'set splitright' in your .vimrc
    "" if you prefer the new window on the right instead of the left

    "nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    "nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    
"" }}}
Bundle 'chazy/cscope_maps'

" A.vim is quick switch to the header file,,
" :A switches to the header file corresponding to the current file being edited (or vise versa) 
" :AS splits and switches 
" :AV vertical splits and switches 
" :AT new tab and switches 
" :AN cycles through matches 
" :IH switches to file under cursor 
" :IHS splits and switches 
" :IHV vertical splits and switches 
" :IHT new tab and switches 
" :IHN cycles through matches 
Bundle 'a.vim'
" }}}


if VundleLoaded('vim-fugitive')
	let g:fugitive_hide_advice_statusHints = 1
	let g:fugitive_stl_showdirtystate      = 1
	let g:fugitive_stl_showstashstate      = 1
" 	let g:fugitive_stl_showuntrackedfiles = 1
endif


" powerline 설정 {{{
if VundleLoaded('vim-powerline')
    set laststatus=2   " Always show the statusline
    "set encoding=utf-8 " Necessary to show Unicode glyphs -> fancy symbols -> need custom font
	"if has('extend_stl_len')
	"	call Pl#Theme#InsertSegment('diff_indicator', 'before', 'fileinfo')
	"endif
	let g:Powerline_colorscheme = 'solarized256'
" 	let g:Powerline_stl_path_style = 'short'
	"if has('gui_running') " font not exists && g:fontface =~? 'for[ _]Powerline'
		"let g:Powerline_symbols = 'fancy'
	"else
		let g:Powerline_symbols = 'compatible'
		let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
		"let g:Powerline_symbols_override = {
		"			\ 'RO': '[RO]',
		"			\ 'FT': 'F/T ',
		"			\ }
        let g:Powerline_mode_V = 'V-LINE'
        let g:Powerline_mode_cv = 'V-BLOCK'
        let g:Powerline_mode_S = 'S-LINE'
        let g:Powerline_mode_cs = 'S-BLOCK'
	"endif
	if has('win32') || has('win64')
		let g:Powerline_cache_file = $TMP . '/Powerline.cache'
		"let g:Powerline_cache_file = $TMP . '/Powerline_' . g:Powerline_theme . '_' . g:Powerline_colorscheme . '_' . g:Powerline_symbols . '.cache'
	endif
endif
" }}}

" Fuzzy Finder 설정  {{{
if VundleLoaded('FuzzyFinder')
    let g:fuf_modesDisable    = []
    let g:fuf_mrufile_maxItem = 400
    let g:fuf_mrucmd_maxItem  = 400
    let g:fuf_file_exclude    = '\v\~$|\.(o|exe|dll|bak|swp|class|pyc|orig)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
    
    map <leader>fz <ESC>:FufFile **/<CR>
    map <leader>fb <ESC>:FufBuffer<CR>
    " Too many {{{
    "nnoremap <silent> sj :FufBuffer<CR>
    "nnoremap <silent> sk :FufFileWithCurrentBufferDir<CR>
    "nnoremap <silent> sK :FufFileWithFullCwd<CR>
    "nnoremap <silent> s<C-k> :FufFile<CR>
    "nnoremap <silent> sl :FufCoverageFileChange<CR>
    "nnoremap <silent> sL :FufCoverageFileChange<CR>
    "nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
    "nnoremap <silent> sd :FufDirWithCurrentBufferDir<CR>
    "nnoremap <silent> sD :FufDirWithFullCwd<CR>
    "nnoremap <silent> s<C-d> :FufDir<CR>
    "nnoremap <silent> sn :FufMruFile<CR>
    "nnoremap <silent> sN :FufMruFileInCwd<CR>
    "nnoremap <silent> sm :FufMruCmd<CR>
    "nnoremap <silent> su :FufBookmarkFile<CR>
    "nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
    "vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
    "noremap <silent> si :FufBookmarkDir<CR>
    "nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
    "nnoremap <silent> st :FufTag<CR>
    "nnoremap <silent> sT :FufTag!<CR>
    "nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
    "nnoremap <silent> s, :FufBufferTag<CR>
    "nnoremap <silent> s< :FufBufferTag!<CR>
    "vnoremap <silent> s, :FufBufferTagWithSelectedText!<CR>
    "vnoremap <silent> s< :FufBufferTagWithSelectedText<CR>
    "nnoremap <silent> s} :FufBufferTagWithCursorWord!<CR>
    "nnoremap <silent> s. :FufBufferTagAll<CR>
    "nnoremap <silent> s> :FufBufferTagAll!<CR>
    "vnoremap <silent> s. :FufBufferTagAllWithSelectedText!<CR>
    "vnoremap <silent> s> :FufBufferTagAllWithSelectedText<CR>
    "nnoremap <silent> s] :FufBufferTagAllWithCursorWord!<CR>
    "nnoremap <silent> sg :FufTaggedFile<CR>
    "nnoremap <silent> sG :FufTaggedFile!<CR>
    "nnoremap <silent> so :FufJumpList<CR>
    "nnoremap <silent> sp :FufChangeList<CR>
    "nnoremap <silent> sq :FufQuickfix<CR>
    "nnoremap <silent> sy :FufLine<CR>
    "nnoremap <silent> sh :FufHelp<CR>
    "nnoremap <silent> se :FufEditDataFile<CR>
    "nnoremap <silent> sr :FufRenewCache<CR>
    " }}}
endif
" }}}

" OmniCppComplete {{{
if VundleLoaded('OmniCppComplete')
    set nocp
    filetype plugin on
    
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_DisplayMode = 0
    let OmniCpp_ShowScopeInAbbr = 0
    let OmniCpp_ShowPrototypeInAbbr = 0
    let OmniCpp_ShowAccess = 1
    let OmniCpp_DefaultNamespaces = []
    let OmniCpp_MayCompleteDot = 1
    let OmniCpp_MayCompleteArrow = 1
    let OmniCpp_MayCompleteScope = 0
    let OmniCpp_SelectFirstItem = 0
    let OmniCpp_LocalSearchDecl = 0
endif
" }}}
    

" link cscope.out
" USE cscope_maps.vim
" NO relation with cscope.vim
if has("cscope")

    "conflict with cscope_maps
    "if filereadable("./cscope.out")
    "        cs add ./cscope.out . -C
    "elseif filereadable("../cscope.out")
    if filereadable("../cscope.out")
            cs add ../cscope.out . -C
    elseif filereadable("../../cscope.out")
            cs add ../../cscope.out . -C
    elseif filereadable("../../../cscope.out")
            cs add ../../../cscope.out . -C
    elseif filereadable("../../../../cscope.out")
            cs add ../../../../cscope.out . -C
    elseif filereadable("../../../../../cscope.out")
            cs add ../../../../../cscope.out . -C
    endif

    if $CSCOPE_DB != ""
            cs add $CSCOPE_DB
    endif

    set csverb
endif



