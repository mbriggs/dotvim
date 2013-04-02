" tab indents (insert mode covered by tabindent)
nnoremap <tab> ==
vnoremap <tab> ==


" alt-tab
nmap ,, <c-^>

" CTags
nmap <C-F5> :!ctags --extra=+f -R *<CR><CR>
nmap <C-\> :tnext<CR>

" jump to matching pair
nnoremap <space><space> %

" jumplist
nmap <left> g;
nmap <right> g,

"c-backspace to delete word
imap <C-BS> <C-W>
cmap <C-BS> <C-W>


"" Hit escape to clear a search
nnoremap <silent> <expr> <CR> &bt == "" ? ":nohlsearch<CR>" : "\<CR>"

"" %% for current dir
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" kill all whitespace
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" set working dir
command! SetDir :cd %:p:h

"navigate/select by paragraph or by word
nmap <c-j> }
vmap <c-j> }
nmap <c-k> {
vmap <c-k> {
nmap <c-h> b
vmap <c-h> b
vmap <c-h> b
nmap <c-l> e
vmap <c-l> e

" front and back of a line
nmap <s-h> ^
nmap <s-l> $

nmap ,rm :!rm <C-R>%<CR>
nmap ,cp :!cp <C-R>% <C-R>%<CR>
nmap ,mv :!mv <C-R>% <C-R>%<CR>

"new line, but stay in command mode
nmap <c-return> mpo<esc>`p

"new line, but stay at current position
imap <c-return> <esc><c-return>a

"visual replace
vmap <silent> r "_dP

"toggle spellcheck
nmap <f4> :set spell!<cr>

" why isn't it this by default??
nnoremap <s-y> y$

"resize window
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>

" kill trailing whitespace
nmap ,kw :%s/\s\+$

" ,so to source current file
nmap <Leader>so :so %<cr>

"\  goes back a jump
nnoremap \ ,

" reclaiming some plugin mappings
vnoremap <esc> <esc>

if has("gui_macvim")
  "cycle split"
  nmap <d-j> <c-w><c-w>

  " d-/ to toggle comment
  nmap <D-/> ,c<space>
  vmap <D-/> ,c<space>

  "d-l to hashrocket in ruby
  au FileType ruby imap <buffer> <d-l> <space>=><space>

  "d-l to make a function in javascript
  au FileType javascript imap <buffer> <d-l> function() {}<esc>i

  " quickfix nav
  nmap <d-left> :cp<cr>

  nmap <d-right> :cn<cr>
endif

if has("gui_gtk2")
  " tabs
  nmap <a-t> :tabe<cr>
  nmap <a-}> :tabn<cr>
  nmap <a-{> :tabp<cr>

  "d-l to hashrocket in ruby
  au FileType ruby imap <buffer> <a-l> <space>=><space>

  "d-l to make a function in javascript
  au FileType javascript imap <buffer> <a-l> function() {}<esc>i

  " ctrl-/ to toggle comment
  nmap <a-/> ,c<space>
  vmap <a-/> ,c<space>

  " select all
  nmap <silent> <a-a> GVgg

  " cycle active split
  nmap <a-j> <c-w><c-w>

  " system copy/paste
  vmap <a-c> "+y
  nmap <a-v> "+p
  nmap <a-x> "+d
  imap <a-v> <c-o><a-v>

  " quickfix nav
  nmap <a-left> :cp<cr>
  nmap <a-right> :cn<cr>
endif
