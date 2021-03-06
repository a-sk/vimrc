macmenu File.New\ Tab key=<D-S-t>
macmenu Edit.Find.Find\.\.\. key=<Nop>
macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR> " Command-Return for fullscreen

" Automatically resize splits when resizing MacVim window
autocmd VimResized * wincmd =

" Mappings"{{{
map <D-/> <plug>NERDCommenterToggle
map <D-F> :LustyFilesystemExplorer<CR>
"map <D-t> :Unite -start-insert -auto-resize -update-time=10 file_rec/async buffer bookmark<CR>
map <D-t> <Leader>t

" Duplicate text
map <D-d> Yp
map <D-D> YP

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i

" Bubble single lines
nmap <D-Up> [e
nmap <D-Down> ]e
nmap <D-k> [e
nmap <D-j> ]e

" Bubble multiple lines
vmap <D-Up> [egv
vmap <D-Down> ]egv
vmap <D-k> [egv
vmap <D-j> ]egv

" Map Command-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt

" scroll another window
nmap <D-d> <c-w>w2<c-e><c-w>w
nmap <D-u> <c-w>w2<c-y><c-w>w

"set background=light
imap <C-tab> <Plug>(neocomplcache_start_unite_complete)
" map <D-j> <Plug>BisectDown
" map <D-k> <Plug>BisectUp
"}}}
set background=dark
colorscheme solarized

set fuoptions=maxhorz,maxvert " Fullscreen takes up entire screen
set guioptions=aAe
set guifont=Envy\ Code\ R\ for\ Powerline\ 11

