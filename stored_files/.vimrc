" https://github.com/gmarik/Vundle.vim
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'camelcasemotion'
Plugin 'camelcasecomplete'
Plugin 'flazz/vim-colorschemes'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Glench/Vim-Jinja2-Syntax'
call vundle#end()
filetype plugin indent on

" Buffer shortcuts
nmap <C-PageUp> :bprev<CR>
nmap <C-PageDown> :bnext<CR>
nmap <C-t> :bprev<CR>
nmap <C-n> :bnext<CR>
nmap <C-d> :bdelete<CR>
nmap <C-d><C-y> :bdelete!<CR>
nmap <C-s> :write<CR>
imap <C-s> <C-o>:write<CR>
nmap <Tab> :FufBuffer<CR>

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
map <C-Down> 2<C-e>
map <C-Up> 2<C-y>
map <C-j> 2<C-e>
map <C-k> 2<C-y>

" Cursor shortcuts
" ,b and ,w require camelcasemotion plugin.
" <ESC>x is the same as Alt-x.
nmap <ESC>b ,b
nmap <ESC>w ,w
nmap <ESC>j 8j
nmap <ESC>k 8k
nnoremap <F11> <C-t>
nmap <F12> g<C-]>
nmap <C-Left> b
nmap <C-Right> w
set whichwrap+=<,>,h,l

" Editing shortcuts
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
" FuzzyFinder aliases.
command FB FufBuffer
command FBT FufBufferTag
command FCF FufCoverageFile
command FF FufFile
command FJL FufJumpList
command FL FufLine
command FRC FufRenewCache
command FT FufTag
nmap <C-p> :FufCoverageFile<CR>
nmap <S-r> :FufBufferTag<CR>
nmap <C-r> :FufTag<CR>
nmap <Leader>o :FufJumpList<CR>

syntax on
colorscheme wombat256i
set background=dark
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
set timeoutlen=300
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
