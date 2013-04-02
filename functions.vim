vnoremap ,rv :call ExtractVariable()<cr>
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    normal! gv
    exec "normal c" . name
    exec "normal! O" . name . " = "
    normal! $p
endfunction

nnoremap ,ri :call InlineVariable()<cr>
function! InlineVariable()
    normal "ayiw
    normal 4diw
    normal "bd$
    normal dd
    normal k$
    exec '/\<' . @a . '\>'
    exec ':.s/\<' . @a . '\>/' . @b
endfunction

command! ShowRoutes call ShowRoutes()
function! ShowRoutes()
  topleft 100 :split __Routes__
  set buftype=nofile
  normal 1GdG
  0r! rake -s routes
  exec ":normal " . line("$") . "_ "
  normal 1GG
  normal dd
endfunction
