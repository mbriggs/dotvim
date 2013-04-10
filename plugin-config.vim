

" snipmate
let g:snips_trigger_key='<c-space>'

" rails
let g:rails_menu=0
let g:rails_installed_menu=0
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
autocmd User Rails/app/presenters/*.*
    \ let b:rails_alternate = substitute(rails#buffer().path(), 'app/','test/unit/','')
autocmd User Rails/app/assets/javascripts/*.*
    \ let b:rails_alternate = fnamemodify(rails#buffer().path(),
    \ ":s?app/assets/?spec/?:r"). "_spec." .
    \ fnamemodify(rails#buffer().path(), ":e")
autocmd User Rails/spec/javascripts/*.*
    \ let b:rails_alternate = fnamemodify(rails#buffer().path(),
    \ ":s?spec/?app/assets/?:s?_spec??")

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" surround
nmap <c-s> ysiw
let g:surround_custom_mapping = {}
let g:surround_custom_mapping.ruby = {
            \ '-':  "<% \r %>",
            \ '=':  "<%= \r %>",
            \ '%':  "%|\r|",
            \ 'w':  "%w(\r)",
            \ '#':  "#{\r}",
            \ }
let g:surround_custom_mapping.javascript = {
            \ 'f':  "function(){ \r }"
            \ }


" testing
au FileType ruby nmap ,tt :RunRubyFocusedTest<cr>
au FileType ruby nmap ,tc :RunRubyFocusedContext<cr>
au FileType ruby nmap ,ta :RunAllRubyTests<cr>

" Ack
nmap ,sl :Ack<space>

" Command-t
let g:CommandTMaxHeight=20
if has("gui_macvim")
  map <silent> <d-f> :CommandT<cr>
  map <silent> <d-d> :CommandT %%<cr>
  map <silent> <d-b> :CommandTBuffer<cr>
else
  map <silent> <c-f> :CommandT<cr>
  map <silent> <c-d> :CommandT %%<cr>
  map <silent> <c-b> :CommandTBuffer<cr>
endif

nmap <silent> <f5> :CommandTFlush<cr>
let g:CommandTMatchWindowAtTop = 1

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" E edits from the local dir
nmap E :VimFiler <C-R>=expand("%:p:h") . "/"<CR><CR>
autocmd BufReadPost vimfiler set bufhidden=delete

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0
let g:syntastic_quiet_warnings=1
let g:syntastic_javascript_checker = 'jshint'
au FileType javascript let g:syntastic_quiet_warnings=0
au BufRead,BufNewFile *.hbs let g:syntastic_enable_signs=0

"neocomplcache
inoremap <expr><C-e>  neocomplcache#cancel_popup()
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_disable_auto_select_buffer_name_pattern = 'GoToFile'
let g:neocomplcache_auto_completion_start_length = 4
let g:neocomplcache_max_list = 100
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_enable_cursor_hold_i = v:version > 703 ||
      \ v:version == 703 && has('patch289')
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ }
let g:neocomplcache_omni_functions = {
      \ 'python' : 'pythoncomplete#Complete',
      \ 'ruby' : 'rubycomplete#Complete',
      \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_snippets_dir = $HOME . '/snippets'
let g:neocomplcache_source_look_dictionary_path = ''
