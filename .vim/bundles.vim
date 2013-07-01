" Init {{{
set nocompatible               " Be iMproved

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle-vim-scripts'

"}}}
" Bundles"{{{
NeoBundle 'AndrewRadev/sideways.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'hdima/python-syntax'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'xolox/vim-misc'
"NeoBundle 'xolox/vim-lua-ftplugin'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
	      \ 'build' : {
	      \     'windows' : 'make -f make_mingw32.mak',
	      \     'cygwin' : 'make -f make_cygwin.mak',
	      \     'mac' : 'make -f make_mac.mak',
	      \     'unix' : 'make -f make_unix.mak',
	      \    },
	      \ }
NeoBundle 'airblade/vim-rooter'
NeoBundle 'aklt/vim-substitute'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'guileen/vim-node'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mmalecki/vim-node.js'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjbach/lusty'
NeoBundle 'sjl/gundo.vim'
"NeoBundle 't9md/vim-unite-ack'
"NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'yejianye/vim-textobj-function'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'vim-scripts/CmdlineComplete'
NeoBundle 'epeli/slimux'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'gregsexton/gitv'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'vim-scripts/vim-json-bundle'
NeoBundle 'sickill/vim-pasta.git'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kana/vim-niceblock'
"NeoBundle 'thinca/vim-ft-diff_fold'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'g3orge/vim-voogle'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle '907th/vim-auto-save'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-submode'
NeoBundle 'marijnh/tern_for_vim', {
          \ 'build' : {
          \     'mac' : 'npm install',
          \     'unix' : 'npm install',
          \    },
          \ }
NeoBundle 'hrsh7th/vim-neco-calc'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tyru/restart.vim'
"}}}
" Post {{{
NeoBundleCheck
" }}}
