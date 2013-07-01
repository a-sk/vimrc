" Load bundles"{{{
source $HOME/.vim/bundles.vim
"}}}
" Vim options {{{
" Compat opts {{{
set nocompatible
set nomodeline   " turn off unsecure modeline
set cpoptions+=$ " to see the border of substituted
set clipboard=unnamed
"}}}
" Search {{{
set ignorecase " Ignore the case of normal letters.
set smartcase  " OVERRIDE IGNORECASE IN CASE
set incsearch  " Enable incremental search.
set hlsearch   " highlight search result.
set wrapscan   " Searches wrap around the end of the file.

"}}}
" Edit {{{
set encoding=utf-8             " Set default encoding to UTF-8
set smarttab
set expandtab                  " Exchange tab to spaces.
set softtabstop=4              " Spaces instead <Tab>.
set tabstop=4
set shiftwidth=4               " Autoindent width.
set shiftround                 " Round indent by shiftwidth.
set backspace=indent,eol,start " Enable backspace delete indent and newline.
set showmatch                  " Highlight parenthesis.
set matchtime=3                " time to show the matching paren
set matchpairs+=<:>            " Highlight <>.
set infercase                  " Ignore case on insert completion.
set foldenable
set isfname-==                 " Exclude = from isfilename. TODO: check if it works
set virtualedit=block          " Enable virtualedit in visual block mode. TODO: what is it ?
set keywordprg=:help           " Set keyword help used by K
set updatetime=500             " CursorHold time.
set isfname-==                 " Exclude = from isfilename.
"}}}
" Backup {{{
set writebackup                      " Make a backup of the original file when writing
set backup                           " and don't delete it after a succesful write.
set backupext=~                      " Backup for file                                 " is " file~
set undofile                         " Set undofile.
set undodir=~/var/vim/undo          " Set undo directory
set backupdir=~/var/vim/backup/     " where to put backup files.
set backupskip=/tmp/*,/private/tmp/* " Make Vim able to edit crontab files again.
set noswapfile                       " It's 2012, Vim.                                 "
"}}}
" Buffer {{{
set switchbuf=useopen,usetab " jump to already opened instead open new
set hidden                   " Display another buffer when current buffer isn't saved.
"}}}
" View {{{
set number                              " Show line number.
set ruler                               " Show line and column number
set wrap                                " Wrap long line.
set whichwrap+=h,l,<,>,[,],b,s,~        " Wrap conditions.
set laststatus=2                        " Always display statusline.
set cmdheight=1                         " Height of command line.
set showcmd                             " Show command on statusline.
set shortmess=atI                       " Do not display greetings message at the time of Vim start.
set visualbell                          " Disable bell.
set vb t_vb=
set history=200                         " Increase history amount.
set undolevels=100                      " Set undo level depth
set showfulltag                         " Display all the information of the tag by the supplement of the Insert mode.
set completeopt=longest,menuone         " Completion setting.
set complete=.,w,b,i,t                  " complete from other buffer.
set pumheight=20                        " Set popup menu max height.
set report=0                            " Report changes.
set nostartofline                       " Maintain a current line at the time of movement as much as possible.
set noequalalways                       " No equal window size.
set previewheight=10                    " Adjust window size of preview and help.
set helpheight=12
set splitbelow                          " Splitting a window will put the new window below the current one.
set splitright                          " Splitting a window will put the new window right the current one.
set winwidth=60                         " Set minimal width for current window.
set winheight=20                        " Set minimal height for current window.
set cmdwinheight=5                      " Set maximam maximam command line window.
set lazyredraw                          " Don't redraw while macro executing.
set display=lastline                    " When a line is long, do not omit it in @.
set formatoptions+=mM                   " Enable multibyte format.
set list                                " Show invisible characters
set listchars=                          " " " Reset the listchars
set listchars=tab:\ \                   " a tab should display as  " "
set listchars+=trail:.                  " show trailing spaces as dots
set listchars+=extends:>                " The character to show in the last column when wrap is
set listchars+=precedes:<               " The character to show in the last column when wrap is
set fillchars=diff:⣿,vert:│             " Characters to fill the statuslines and vertical separators
set titlelen=95                         " Title length.
set colorcolumn=85                      " Highlight 85-th column
set conceallevel=2 concealcursor=i     " For conceal.
"set t_Co=256
"let g:solarized_termcolors=256

set t_Co=16
set background=dark
colorscheme solarized

" Title string.
let &titlestring="%{(&filetype ==# 'lingr-messages' && lingr#unread_count() > 0 )?"
      \ . " '('.lingr#unread_count().')' : ''}%{expand('%:p:.:~')}%(%m%r%w%)"
      \ . " \ %<\(%{SnipMid(fnamemodify(&filetype ==# 'vimfiler' ?"
      \ . "substitute(b:vimfiler.current_dir, '.\\zs/$', '', '') : getcwd(), ':~'),"
      \ . "80-len(expand('%:p:.')),'...')}\) - Vim"

"}}}
" Wildmenu completion {{{
set wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files"
"}}}
" Behavior {{{
set nrformats= " treat all numerals as decimal
augroup MyAutoCmd {{{
  " Close help and git window by pressing q.
  autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref,simpletap-summary nnoremap <buffer><silent> q :<C-u>close<CR>
  autocmd FileType * if &readonly |  nnoremap <buffer><silent> q :<C-u>close<CR> | endif
augroup END
"}}}
"}}}
" Folding {{{
set foldtext=MyFoldText()
" }}}
"}}}
" File types"{{{

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

set autoindent
set smartindent
syntax on

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " Treat pentadactylrc as vimrc
  au BufNewFile,BufRead *.pentadactylrc set ft=vim
  au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node/dict/node.dict
  au FileType javascript nnoremap <silent><buffer> gd :TernDef<CR>
  au FileType javascript nnoremap <silent><buffer> gD :TernDefPreview<CR>
  au FileType javascript nnoremap <silent><buffer> gr :TernRename<CR>

  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Map <CR> to toggle folds, but not in quickfix mode
  " au BufEnter * if &filetype != 'qf' && &filetype != 'unite' && &filetype != 'gundo' |  echo 'mapped' | nmap <buffer> <CR> za

  " This actually might be confusing, but the plugin +ruby+ already does
  " this, so we want to do it only if the plugin +ruby+ is disabled for
  " some reason
  " Set the Ruby filetype for a number of common Ruby files without .rb
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | call s:setupWrapping()

  au! BufRead,BufNewFile *.json set filetype=json
  au BufNewFile,BufRead *.js setl foldmethod=syntax softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
  autocmd BufWritePre *.js :%s/\s\+$//e

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
  autocmd BufWritePre *.py :%s/\s\+$//e

  au FileType jade set softtabstop=2 tabstop=2 shiftwidth=2
  au FileType stylus set softtabstop=2 tabstop=2 shiftwidth=2

  au FileType coffee setl softtabstop=2 tabstop=2 shiftwidth=2
  au FileType coffee setl foldmethod=indent nofoldenable
  autocmd BufWritePre *.coffee :%s/\s\+$//e
  " au FileType python :IndentGuidesEnable<CR
  au FileType python Rooter
  au FileType javascript Rooter
  au FileType coffee Rooter

  au BufRead,BufNewFile *.rs set ft=rust
  au BufRead,BufNewFile *.go set ft=go
  au BufRead,BufNewFile *.txt set ft=markdown

  " I like to use nice folded vim files
  au FileType vim set foldmethod=marker

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Enable omni completion.
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType muttrc setlocal foldmethod=marker
  au FileType go set foldmethod=syntax

  " Turn off completion, it's more disruptive than helpful
  "function! s:markdown_disable_autocomplete()
      "if &ft ==# 'markdown'
          ":NeoComplCacheLock
      "endif
  "endfunction
  "autocmd BufEnter * call s:markdown_disable_autocomplete()


endif
"}}}
" Mappings {{{
" Remap leader  {{{
" Remaping leader to space
" this is not compatible with space.vim
nmap  <Space>   <leader>
xmap  <Space>   <leader>
nnoremap  <leader>   <Nop>
xnoremap  <leader>   <Nop>
"let mapleader = ","
"}}}
" Normal mode keymapping  {{{

" Markdown preview.  http://rtomayko.github.com/bcat/
map <Leader>m :!markdown % <Bar>bcat<CR>
nnoremap <C-o> <C-o>zz

" <Leader>s: Spell checking shortcuts
nnoremap <Leader>S :setlocal spell!<cr>
nnoremap <Leader>sn ]s
nnoremap <Leader>sN [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=

"strip all trailing white space
nnoremap <silent> <leader>w  :call Preserve("%s/\\s\\+$//e")<CR>

" Quickfix mappings
nnoremap <leader>; :cn<CR>
nnoremap <leader>' :cp<CR>

" Select last pasted text from yank/delete
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

nmap <leader>t :Unite -buffer-name=files" -start-insert -auto-resize -update-time=10 file_rec/async<CR>
nmap <leader>m :Unite -buffer-name=man" -start-insert -auto-resize ref/man<CR>
nmap <leader>T :CtrlP<CR>

nnoremap <silent> <leader>Cd :lcd %:h<CR>

" use substitute plugin
let g:substitute_NoPromptMap = '<C-f>'

" resize panes
nnoremap <C-w><C-j> <C-w>+
nnoremap <C-w><C-k> <C-w>-

" Yankring
nmap <C-y> <Plug>yankstack_substitute_older_paste
nmap <C-Y> <Plug>yankstack_substitute_older_paste

" Inspired by emacs
nmap <C-x>f :LustyFilesystemExplorer<CR>

nmap <leader>e :LustyFilesystemExplorer<CR>

nnoremap <silent> <leader>] :GitGutterNextHunk<CR>
nnoremap <silent> <leader>[ :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>G :GitGutterToggle<CR>

" find merge conflict markers
nmap <silent> <leader>nm <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

runtime macros/matchit.vim
"nnoremap <tab> %

nnoremap Y y$

" Disable stupding keys
nnoremap <silent> <left> :bprev<CR>
nnoremap <silent> <right> :bnext<CR>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

" Clear search matches higliighting
noremap <leader><esc> :noh<cr>:call clearmatches()<cr>

" Keep search matches in the middle of the window and pulse the line when
" moving  to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Space <leader>space to toggle folds.
nnoremap <Leader><Space> za
" Space enter to toggle folds.
"nnoremap <CR> za

" Easier linewise reselection
"nnoremap <leader>V V`]

" Don't move on *
nnoremap * *<c-o>

" Allows to go throw wrapped lines
noremap j gj
noremap k gk

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_
vnoremap H ^
vnoremap L g_

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Tabs
nmap gn :tabnew<CR>
nmap gc :tabclose<CR>

" Git
nnoremap <Leader>q :!git add % && git commit -m ''<Left>
nnoremap <silent> <Leader>g :Gstatus<CR>
nnoremap <silent> <Leader>c :Gstatus<CR>

" pasting
set pastetoggle=<F2>
" Copy to / paste from system pasteboard.
" (Use `:put *<CR>` and `:put! *<CR>` for linewise pasting.)
noremap <Leader>y "*y
noremap <Leader>p :set paste<CR>"*p:set nopaste<CR>
noremap <Leader>P :set paste<CR>"*P:set nopaste<CR>

nnoremap <silent> - :Switch<cr>

"Plugins mappings"{{{

" Slimux
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendSelection<CR>

nnoremap <leader>o :ZoomWin<CR>

nnoremap <silent>> :SidewaysRight<CR>
nnoremap <silent>< :SidewaysLeft<CR>

"Crazy japan plugins mappings {{{

nnoremap <leader>f          :VimFiler<CR>
nnoremap <C-b>              :Unite -start-insert buffer -auto-resize -update-time=10<CR>
nnoremap <leader>b          :Unite -start-insert buffer -auto-resize -update-time=0<CR>
nnoremap <leader>/          :<C-u>Unite -buffer-name=search line/fast -start-insert<CR>
nnoremap <leader>r          :Unite -start-insert file_mru -update-time=10<CR>
nnoremap <leader>d          :Unite -start-insert outline<CR>

"}}}

"}}}
"}}}
" Visual mode keymappings:  {{{

vnoremap > >gv
vnoremap < <gv

" Source selected
vnoremap <leader>s y:execute @@<cr>

vnoremap / <Esc> /\%V
vnoremap ? <Esc> ?\%V

xnoremap <CR>    c
xnoremap <TAB>   >gv
xnoremap <S-TAB> <gv
"}}}
"}}}
" Plugins {{{
" Tagbar {{{
let g:tagbar_autoshowtag = 1 " Highlight tag while mooving
let g:tagbar_usearrows = 1   " Fancy arrows
let g:tagbar_expand = 1      " Auto expanding nested tags
let g:tagbar_type_coffee = {
    \ 'ctagsbin' : 'coffeetags',
    \ 'ctagsargs' : '',
    \ 'kinds' : [
    \ 'f:functions',
    \ 'o:object',
    \ ],
    \ 'sro' : ".",
    \ 'kind2scope' : {
    \ 'f' : 'object',
    \ 'o' : 'object',
    \ }
    \ }
"}}}
" Unite"{{{
" settings {{{
let g:unite_source_file_rec_ignore_pattern = 'node_modules\|\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\|class\|pyc\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'
let g:unite_source_grep_default_opts = '-iRHn --exclude-dir node_modules'
let g:unite_source_history_yank_enable = 1
let g:unite_source_directory_mru_limit = 300
let g:unite_source_file_mru_limit = 300
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--smart-case --nocolor --nogroup --column --ignore node_modules'
let g:unite_source_grep_recursive_opt = ''

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

augroup UniteAutoCmd
    autocmd!
augroup END
" }}}
" mappings {{{
nnoremap <leader>a :<C-u>Unite grep -default-action=above<CR>
nnoremap <leader>A :<C-u>execute 'Unite grep:.::' . expand("<cword>") . ' -default-action=above -auto-preview'<CR>
nnoremap <leader>ps :<C-u>:Unite process -buffer-name=processes -start-insert<CR>
nnoremap <C-p> :<C-u>:Unite history/yank -buffer-name=yanks<CR>
" Quick find
nnoremap <silent> <Leader>f :<C-u>Unite -buffer-name=find find:.<CR>
" }}}
" file_rec/async customization {{{
call unite#custom_source('file_rec/async', 'sorters', ['sorter_length'])
call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy', 'matcher_hide_hidden_files'])
call unite#custom_source('file_rec/async', 'sorters', ['sorter_length'])
call unite#custom_source('file_rec/async', 'converters', ['converter_relative_word'])
call unite#custom_source('file_rec/async', 'max_candidates', 200)
" }}}
"}}}
" Neocomplete {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
" Neocomplcache {{{
" settings {{{
let g:neocomplcache_enable_underbar_completion = 1     " m_l_f -> my_long_function; also works with file paths
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1   " Use camel case completion.
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_manual_completion_start_length = 0 " Set manual completion length.
let g:neocomplcache_max_list = 100
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_enable_prefetch = 1
" }}}
"mappings {{{
"imap <expr> <C-s>  pumvisible() ?
            "\ "\<Plug>(neocomplcache_start_unite_quick_match)" : <C-s>
"}}}
"}}}
" Neosnippets {{{
"settings {{{
let g:neosnippet#snippets_directory = "$HOME/.vim/snippets"
"}}}
" mappings {{{
imap <C-\>     <Plug>(neosnippet_expand_or_jump)
xmap <C-\>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"
" }}}
" }}}
" Vimfiler {{{
"settings {{{
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" Disable vimfiler's safe mode to mv rm etc
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_data_directory = expand('~/var/vim/vimfiler/')
function! s:vimfiler_settings()
    nmap <buffer> % <Plug>(vimfiler_new_file)
    nmap <buffer> <Backspace> <C-^>
endfunction
autocmd UniteAutoCmd Filetype vimfiler call s:vimfiler_settings()

"}}}
"mappings {{{
nno ` :<C-u>:VimFilerBufferDir -buffer-name=explorer -toggle<CR>
"}}}
"}}}
" Vimshell {{{
let g:vimshell_editor_command = '/usr/bin/vim --servername=v:servername --remote-tab-wait-silent'
let g:vimshell_prompt         = '❯ '
let g:vimshell_user_prompt    = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt   = 'vcs#info("(%s)-[%b]%p", "(%s)-[%b|%a]%p")'
" }}}
" Ref {{{
let g:ref_use_vimproc = 1
let g:ref_open = 'vsplit'
let g:ref_cache_dir = expand('~/var/vim/ref/ref_cache/')
" }}}
" Syntastic {{{
let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['html']
" let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_python_checkers=['pylint']
let b:shell = 'bash'

" those fancy symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
"}}}
" Tags depending plugins {{{
let g:tagbar_ctags_bin="/usr/bin/ctags"
let g:neocomplcache_ctags_program="/usr/bin/ctags"
"}}}
" Bisect"{{{
let g:bisect_force_strict_bisection = 1
let g:bisect_disable_normal = 1
let g:bisect_disable_insert = 1
let g:bisect_disable_paging = 1
let g:bisect_disable_save_visual_start_position = 0
let g:bisect_disable_stop_mappings = 1
"}}}
" Others  {{{
let g:surround_indent         = 1                        "  Automatically reindent text surround.vim actions
let g:Powerline_symbols       = 'fancy'
let g:rooter_use_lcd          = 1
let g:gitgutter_enabled       = 0
let g:junkfile#directory      = "$HOME/var/vim/junkfiles"
let g:voogle_browser          = "/usr/bin/google-chrome"

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#leave_with('undo/redo', 'n', '', '<Esc>')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')
let g:lua_complete_omni = 1
"
"

"}}}
"}}}
" Functions {{{
function! SnipMid(str, len, mask)"{{{
  if a:len >= len(a:str)
    return a:str
  elseif a:len <= len(a:mask)
    return a:mask
  endif

  let len_head = (a:len - len(a:mask)) / 2
  let len_tail = a:len - len(a:mask) - len_head

  return (len_head > 0 ? a:str[: len_head - 1] : '') . a:mask . (len_tail > 0 ? a:str[-len_tail :] : '')
endfunction"}}}
function! WillComplete()"{{{
" Determines if completion should be kicked off at the current location
" Taken from SuperTab

  if pumvisible()
    return 1
  endif

  let line = getline('.')
  let cnum = col('.')

  " Start of line.
  if line =~ '^\s*\%' . cnum . 'c'
    return 0
  endif

  let pre = line[:cnum - 2]
  for pattern in ['\s']
    if pre =~ pattern . '$'
      return 0
    endif
  endfor

  " Within a word, but user does not have mid word completion enabled.
  let post = line[cnum - 1:]
  for pattern in ['k']
    if post =~ '^' . pattern
      return 0
    endif
  endfor

  return 1
endfunction " }}}
function! TabOrComplete()"{{{
  if pumvisible()
      return "\<C-n>"
  elseif neocomplcache#sources#snippets_complete#expandable()
      return "\<Plug>(neocomplcache_snippets_expand)"
  endif
  if WillComplete()
    return neocomplcache#start_manual_complete()
  endif
  return "\<Tab>"
endfunction"}}}
function! SmartEnter()"{{{
    if pumvisible()
        return "\<C-y>"
    else
        return "\<CR>"
    endif
endfunction"}}}
function! Preserve(command) " {{{
"Preserves/Saves the state, executes a command, and returns to the saved state
"From http://vimcasts.org/episodes/tidying-whitespace/
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
"}}}
function! MyFoldText() "{{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart
    let percent = printf("[%.1f", (foldedlinecount * 1.0)/line('$') * 100) . "%]"
    let info = foldedlinecount . ' ' . percent

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let line = substitute(line, '^"', '', 'g')
    let line = substitute(line, '"{{{', '', 'g')
    let line = substitute(line, '{{{', '', 'g')

    let line = strpart(line, 0, windowwidth)
    let fillcharcount = windowwidth - len(line) - len(info) + 1
    return line . '…' . repeat(" ",fillcharcount) . info . '…' . ' '
endfunction
"}}}
"}}}
