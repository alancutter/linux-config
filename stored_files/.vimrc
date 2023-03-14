" Buffer shortcuts
nmap <C-PageUp> :bprev<CR>
nmap <C-PageDown> :bnext<CR>
nmap <C-t> :bprev<CR>
nmap <C-n> :bnext<CR>
nmap <C-d> :bdelete<CR>
nmap <C-d><C-y> :bdelete!<CR>
nmap <C-s> :write<CR>
imap <C-s> <C-o>:write<CR>

" Window shortcuts
let mapleader=' '
map <Leader>h  <C-W>h
map <Leader>j  <C-W>j
map <Leader>k  <C-W>k
map <Leader>l  <C-W>l
map <Leader><Left>  <C-W>h
map <Leader><Down>  <C-W>j
map <Leader><Up>  <C-W>k
map <Leader><Right>  <C-W>l

" View shortcuts
nnoremap J <C-e>
nnoremap K <C-y>
noremap <C-j> <PageDown>
noremap <C-k> <PageUp>

" Cursor shortcuts
nmap <ESC>j 8j
nmap <ESC>k 8k
nnoremap <F11> <C-t>
nmap <F12> g<C-]>
nmap <C-Left> b
nmap <C-Right> w
set whichwrap+=<,>,h,l

" Editing shortcuts
inoremap <C-q> <ESC>Ja
nmap <S-Up> :m .-2<CR>
nmap <S-Down> :m .+1<CR>
nnoremap U <C-r>
nmap  0i//<ESC>j0
nnoremap <C-h> :set hls<CR>:.,$s//gc<Left><Left><left>
nnoremap H :set hls<CR>yiw:.,$s//gc<Left><Left><left><C-r>0/
vmap <C-c> "+y

" Misc shortcuts
" Switch to header/source file.
nmap <ESC>o :e %:p:s,.h$,.PLACEHOLDER,:s,.cpp$,.h,:s,.PLACEHOLDER,.cpp,<CR>
nmap <C-q> @q
nmap <F3> n
nmap <F4> *
vmap <F4> y:set hls<CR>/\V<C-r>"<CR>
nmap <F8> @
nmap <C-l> :set invhls<CR>
nmap <F5> :e!<CR>
nnoremap s /\V
nnoremap / /\v
command OT edit ~/tests/test.html
command EVRC edit ~/.vimrc
command CFP let @+ = expand("%:p")
command! -bar -nargs=1 TS :set tabstop=<args> shiftwidth=<args>
command Delete call delete(expand('%'))
command! -bar -nargs=1 -bang -complete=file Rename :
  \ let s:file = expand('%:p') |
  \ let s:newfile = expand("%:p:h") . "/<args>" |
  \ setlocal modified |
  \ exec 'keepalt saveas<bang> ' . s:newfile |
  \ if s:file !=# expand('%:p') |
  \   call delete(s:file) |
  \ endif |
  \ unlet s:file |
  \ unlet s:newfile

syntax on
colorscheme wombat256i
highlight Normal guibg=black
set background=dark
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set number
set scrolloff=4
set shiftwidth=4
set showcmd
set smartindent
set tabstop=4
set tags+=tags;$HOME
set timeoutlen=100
set ttimeoutlen=0
set wildignore+=*.o,*.obj,.git,*.pyc,*.o.d
set colorcolumn=81
hi ColorColumn ctermbg=Black guibg=Black

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Add highlighting for function definition in C++.
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

function! TextEnableCodeSnip(filetype,start,end) abort
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
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

autocmd BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{{', '}}')
autocmd BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{%', '%}')
autocmd BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{#', '#}')

autocmd BufRead,BufNewFile *.cpp.tmpl set filetype=cpp
autocmd BufRead,BufNewFile *.h.tmpl set filetype=cpp
