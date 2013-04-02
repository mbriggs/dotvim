set nocompatible
filetype off

" vundle
source ~/.vim/bundle.vim

if filereadable($HOME . "/.vim/.plugins_installed")
  " configure plugins
  source ~/.vim/plugin-config.vim

  " set up autocmds
  source ~/.vim/autocmds.vim

  " set up custom functions
  source ~/.vim/functions.vim

  " set up modeline
  source ~/.vim/statusline.vim

  " configure vim settings
  source ~/.vim/settings.vim
endif
