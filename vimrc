
" Pathogen setup
set nopaste
execute pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" Pymode setttings
let g:pymode_lint_ignore = "E402"
set completeopt-=preview


"let g:pymode = 0
"let g:pymode_options_colorcolumn = 0
let g:pymode_rope=0
let g:pymode_rope_completion = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_folding = 0

let g:SimpylFold_fold_docstring = 0

" Colorscheme settings
set background=dark
colorscheme solarized
if &diff
    colorscheme pablo
endif

" Menu settings
set wildmenu
set wildmode=longest,list,full

" SQL indent settings
autocmd BufNewFile,BufRead *.db2   set syntax=sql
autocmd BufNewFile,BufRead *.txt   set syntax=sql
autocmd BufNewFile,BufRead *.sql setlocal expandtab tabstop=4 shiftwidth=4 ai indentexpr=
autocmd BufNewFile,BufRead *.db2 setlocal expandtab tabstop=4 shiftwidth=4 ai indentexpr=
autocmd BufNewFile,BufRead *.txt setlocal expandtab tabstop=4 shiftwidth=4 ai indentexpr=
autocmd BufNewFile,BufRead *.md setlocal expandtab tabstop=4 shiftwidth=4 ai indentexpr=


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

vmap <leader>ss !sqlformat --reindent --keywords upper --identifiers lower %

set foldnestmax=1

autocmd BufNewFile,BufRead *.c set colorcolumn=80
autocmd BufNewFile,BufRead *.cu set colorcolumn=80
autocmd BufNewFile,BufRead *.h set colorcolumn=80

nmap <leader>p :set paste!<CR>

set backupdir=~/.vim/swapfiles
set directory=~/.vim/swapfiles

set rtp+=~/.fzf
nmap <leader>f :FZF<CR>

let g:airline#extensions#tabline#enabled = 1
