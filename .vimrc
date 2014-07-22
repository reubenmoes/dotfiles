set nocompatible
"filetype off
filetype plugin on

"https://github.com/tpope/vim-pathogen
"execute pathogen#infect()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"My github vundles
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/loremipsum'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-surround'
Bundle 'msanders/snipmate.vim'
Bundle 'rstacruz/sparkup'
Bundle 'sukima/xmledit'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/dbext.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'

set background=dark
colorscheme desert

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

syntax on
set nu
set autoindent
set expandtab
" set noexpandtab to switch to tabs like a freak
set tabstop=2
set shiftwidth=2
set ic


command Sudow w !sudo tee % >/dev/null

" Remap :W to :w
command W w
command Wq wq

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript
" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

"PHP/HTML
au BufRead,BufNewFile *.php set ft=php.html
