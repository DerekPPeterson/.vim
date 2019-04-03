
" Pathogen setup
set nopaste
execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

"YCM settings
let g:ycm_confirm_extra_conf=0
"let g:ycm_always_populate_location_list = 1

" Pymode setttings
let g:pymode_lint_ignore = "E402"
set completeopt-=preview

let g:airline_powerline_fonts = 1


"let g:pymode = 0
"let g:pymode_options_colorcolumn = 0
"let g:pymode_rope=0
"let g:pymode_rope_completion = 0
let g:pymode_lint_cwindow = 0
"let g:pymode_rope_regenerate_on_write = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_autoimport = 0
"let g:pymode_folding = 0
"
"let g:SimpylFold_fold_docstring = 0

set completeopt-=preview

" Colorscheme settings
set background=dark
colorscheme solarized

" Menu settings
set wildmenu
set wildmode=longest,list,full

setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ai 
autocmd BufNewFile,BufRead *.md setlocal expandtab tabstop=4 shiftwidth=4 ai indentexpr= 
autocmd BufNewFile,BufRead *.cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ai 
autocmd BufNewFile,BufRead *.h setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ai 

" SQL syntax highlighlighting in pyton, use '''
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

au FileType python call TextEnableCodeSnip('sql', "'''", "'''", 'SpecialComment')

" SQL format options
let g:sqlutil_align_comma=1
let g:sqlutil_keyword_case = '\U'

nmap <leader>S :set syntax=sql<CR>

"set foldnestmax=1

autocmd BufNewFile,BufRead *.c set colorcolumn=80
autocmd BufNewFile,BufRead *.cpp set colorcolumn=80
autocmd BufNewFile,BufRead *.cu set colorcolumn=80
autocmd BufNewFile,BufRead *.h set colorcolumn=80

autocmd BufNewFile,BufRead *.vs set filetype=glsl
autocmd BufNewFile,BufRead *.fs set filetype=glsl

autocmd BufNewFile,BufRead *.json set foldmethod=syntax

nmap <leader>p :set paste!<CR>
nmap <leader>jf :%!python -m json.tool<CR>

set backupdir=~/.vim/swapfiles
set directory=~/.vim/swapfiles

set rtp+=~/devel/fzf
nmap <leader>f :FZF<CR>

nmap <leader>e :lnext<CR>
nmap <leader>E :lprev<CR>

set hlsearch
set cursorline
set number

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
