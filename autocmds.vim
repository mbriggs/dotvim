
" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" automatically make the dirs recursively if they aren't there
autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
function! s:auto_mkdir(dir, force)
  if !isdirectory(a:dir)
        \ && (a:force
        \ || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby


" set spell check
autocmd filetype svn,*commit*,markdown set spell

" clean up vimfiler and fugitive buffers
autocmd BufReadPost fugitive://*,vimfiler set bufhidden=delete

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkdownBuffer()
function! s:setupMarkdownBuffer()
  set ft=markdown
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" strip trailing whitespace
au BufWritePre * :%s/\s\+$//e

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Close help and git window by pressing q.
autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref,simpletap-summary,vcs-commit,vcs-status
      \ nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>
autocmd FileType * if (&readonly || !&modifiable) && !hasmapto('q', 'n')
      \ | nnoremap <buffer><silent> q :<C-u>call <sid>smart_close()<CR>| endif

function! s:smart_close()
  if winnr('$') != 1
    close
  endif
endfunction
