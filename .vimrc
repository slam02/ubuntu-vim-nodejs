set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vi
" behave mswin

" pathogen plugin startin
call pathogen#infect()
syntax on
filetype plugin indent on

" set diffexpr=MyDiff()
" function MyDiff()
" let opt = '-a --binary '
" if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
" if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
" let arg1 = v:fname_in
" if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
" let arg2 = v:fname_new
" if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
" let arg3 = v:fname_out
" if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
" let eq = ''
" if $VIMRUNTIME =~ ' '
" if &sh =~ '\<cmd'
" let cmd = '""' . $VIMRUNTIME . '\diff"'
" let eq = '"'
" else
" let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
" endif
" else
" let cmd = $VIMRUNTIME . '\diff'
" endif
" silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

" set color scheme
syntax enable

colorscheme iceberg

" Display line number
set number

" Diff always vertical
set diffopt=vertical

" make backspace work like most other apps
set backspace=indent,eol,start

" sets trailing spaces and tabs to easily visible characters
set list listchars=tab:->,trail:.,

" Show all the white space character
set list

" Change the current directory to the open file
" set autochdir

" ---------------------------------------------------
" Search
" ---------------------------------------------------
set hlsearch
" Press F3 to toggle highlighting on/off.
:noremap <F3> :set hls!<CR>
" Ignore case when searching
set ignorecase
" use case-sensitive search if your search contains an uppercase character
set smartcase
" Show the search result as you type
set incsearch

" ---------------------------------------------------
" Tabulation and identation
" ---------------------------------------------------
" preserve current indent on new lines
set autoindent
" Do not wrap lines
set nowrap
" indent/outdent to nearest tabstops
set shiftround
" indentation levels every four columns
set tabstop=4
" "number of space characters inserted for indentation
set shiftwidth=4
" this is to make sure vim replaces tabs by spaces
set expandtab

"----------------------------------------------------
" Beeping
"----------------------------------------------------
" Do not ring the bell for error messages
set noerrorbells
" Use visual bell and remove flash
autocmd VimEnter * set vb t_vb=

" ---------------------------------------------------
" Remove the backup option (~ and .swp files)
" ---------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set noundofile

" ---------------------------------------------------
" Trim extra white spaces at end of lines
" ---------------------------------------------------
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e

" ---------------------------------------------------
" Shortcuts for VIM tabs
" ---------------------------------------------------
" ctrl-tab for next tab
" nmap <C-Tab> :tabnext <CR><ESC>
" ctrl-shift-tab for previous tab
" nmap <C-S-Tab> :tabprevious <CR><ESC>
" creates a new tab
" nmap <C-n> :tabnew<CR><ESC>
" close the current tab
" DOES NOT WORK - VIM maps ctrl-n and ctrl-shirt-n to the same acsii code
" source: https://groups.google.com/forum/#!topic/vim_use/sQVCPUn9-vY
" nmap <C-S-n> :tabclose<CR><ESC>
" ---------------------------------------------------
" P4 shortcuts
" ---------------------------------------------------
" check out the file
" map <F4> :cd %:h<CR> :! p4 edit %<CR> :w!<CR>
" ---------------------------------------------------
" python shortcuts
" ---------------------------------------------------
" print the 'import pdb; pdb.set_trace()' command
" nmap <F9> iimport pdb; pdb.set_trace()<ESC>o<ESC>:w<CR>
" ---------------------------------------------------
" US Sanity Test shortcut
" ---------------------------------------------------
" nmap <F2> :!start cmd /c d:&cd ..&npm test&pause<CR>

" ---------------------------------------------------
" JS specific shortcuts
" ---------------------------------------------------
" in order to prevent some plugins (like delimiter) to interfer with the typed
" characters, the content is provided to a register, and this register is
" printed
" the delimiter plugin was adding double quote, single quotes, ....
" using the registers make those mapping agnostic of the plugins.
" the 'oi<BS><esc>' is just to et leverage the automatic indentation provided
" by vim 'o' while still returning in normal mode with the <esc>
nmap <F2> yiwoi<BS><esc>:let @m = 'console.log(''jf-debug-> "' . @" . '": '', ' . @" . ');'<enter><esc>"mp
vmap <F2> yoi<BS><esc>:let @m = 'console.log(''jf-debug-> "' . @" . '": '', ' . @" . ');'<enter><esc>"mp
nmap <F3> oi<BS><esc>:let @m = 'console.log(''jf-debug-> arguments: '', arguments);'<enter><esc>"mp<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nmap <F4> yiwoi<BS><esc>:let @m = 'console.log(''jf-debug-> "' . @" . '": '', require(''util'').inspect(' . @" . ', {depth:100, colors:true}));'<enter><esc>"mp
vmap <F4> yoi<BS><esc>:let @m = 'console.log(''jf-debug-> "' . @" . '": '', require(''util'').inspect(' . @" . ', {depth:100, colors:true}));'<enter><esc>"mp

" ---------------------------------------------------
" Adding batch file comment type. Used with plugin commentary
" ---------------------------------------------------
autocmd FileType dosbatch set commentstring=::\ %s

" ---------------------------------------------------
" Chaning the font for MAC only because the base font is too small.
" ---------------------------------------------------
if has('mac')
  set guifont=Menlo\ Regular:h13
elseif has('unix')
  set guifont=Droid\ Sans\ Mono\ 11
endif

" ---------------------------------------------------
" Call the js beautify plugin https://github.com/maksimr/vim-jsbeautify
" ---------------------------------------------------
" map <c-f> :call JsBeautify()<cr>
map <c-f> :call RangeJsBeautify()<cr>
" or
" autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
" autocmd BufWritePre *.js :call JsBeautify()

" ---------------------------------------------------
" Syntastic configs
" ---------------------------------------------------
" apparently, if both jslint and jshint are installed, it always uses jslint
" I want jshint.
" source: https://github.com/scrooloose/syntastic/pull/47
" let g:syntastic_javascript_checkers = ["jshint", \"jslint\"]
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_jshint_quiet_messages ={ "regex" : "Too many errors" }
" let g:syntastic_javascript_jshint_quiet_messages ={ "regex" : "Redefinition of \'.*\'" }
" let g:syntastic_quiet_messages = { "level" : "warnings" }
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"] " hides angular eerrors. source: http://stackoverflow.com/questions/18270355/how-to-ignore-angular-directive-lint-error-with-vim-and-syntastic
let g:syntastic_always_populate_loc_list = 1 "Enable this option to tell syntastic to always stick any detected errors into the |location-list|:
let g:syntastic_auto_loc_list = 1 " When set to 1 the error window will be automatically opened when errors are detected, and closed when none are detected. >
" let g:syntastic_aggregate_errors = 1
"
let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["html"] }

" ---------------------------------------------------
" UtilsSnip configs
" ---------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" UltiSnips is the default bundle used by UltiSnips. It is installed via
" 'vim-snippets' plugin
let g:UltiSnipsSnippetDirectories=["UltiSnips", "jfsnippets"]


" ---------------------------------------------------<left>
" Setting JSON file type so sourcebeautify can beautify json files.
" not used anymore. Left so vim-jebeautify can format json files.
" ---------------------------------------------------
autocmd BufRead,BufNewFile *.json setf json

" ---------------------------------------------------
" EasyAlign setup
" ---------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" ---------------------------------------------------
" terryma/vim-multiple-cursors setup
" ---------------------------------------------------
" When in insert mode, 'esc' does not exit multi cursor mode but rather fall
" back to normal. A 2nd 'esc' quits multi cursors.
let g:multi_cursor_exit_from_insert_mode=0
" When in visual mode, 'esc' does not exit multi cursor mode but rather fall
" back to normal. A 2nd 'esc' quits multi cursors.
let g:multi_cursor_exit_from_visual_mode=0

" ---------------------------------------------------
" ag vim configs
" ---------------------------------------------------
" hightlight the search results
let g:aghighlight=1
" <C-r><C-w> returns the word under the cursor
" info taken here: http://stackoverflow.com/questions/13511084/vim-set-cursor-position-in-command-line
" and here: http://stackoverflow.com/questions/27297304/how-to-append-the-output-of-a-function-in-a-normal-mapping-command/27297508
nnoremap <expr> <leader>f ':Ag --ignore node_modules --ignore assets -S "" "' . getcwd() . '"<C-Left><Left><Left>'
" <C-r><C-w> returns the word under the cursor
nnoremap <expr> <leader>fw ':Ag --ignore node_modules --ignore assets -S "<C-r><C-w>" "' . getcwd() . '"<C-Left><Left><Left>'

" ---------------------------------------------------
" NERDTree configuration
" ---------------------------------------------------
" automatically open NERDTree when vim opens, even when no files are specified.
" source: https://github.com/scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" automatically open NERDTree when a file is specified at command line
autocmd vimenter * NERDTree

" statusline settings
" taken from: http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
" more here: http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
set laststatus=2 " 2 - always show the status line (0 = never, 1 = (default) only if there are two or more windows, 2 = always)
set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%5*%{&ff}%* "file format
set statusline +=%3*%y%* "file type
set statusline +=%4*\ %<%F%* "full path
" used by syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" end user by suntastic
"
set statusline +=%2*%m%* "modified flag
set statusline +=%1*%=%5l%* "current line
set statusline +=%2*/%L%* "total lines
set statusline +=%1*%4v\ %* "virtual column number
set statusline +=%2*0x%04B\ %* "character under cursor
