" Command-t
let g:CommandTMaxHeight=20
macmenu &File.New\ Tab key=<nop>
nmap <silent> <D-t> :CommandT<cr>
imap <silent> <D-t> <esc>:CommandT<cr>
nmap <silent> <f5> :CommandTFlush<cr>
let g:CommandTMatchWindowAtTop = 1
