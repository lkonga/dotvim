" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
	filetype on
	filetype plugin indent on
	filetype plugin on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

" Nerdtree
map <F2> :NERDTreeToggle<CR>

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" must be default
set title
" might interfere with some plugins
set autochdir


set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start		
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
				  " allow backspacing over everything in insert mode
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile


filetype plugin indent on
if has('autocmd')
		autocmd filetype python set expandtab
endif

if $COLORTERM == 'gnome-terminal'
		  set t_Co=256
endif

if $COLORTERM == 'rxvt'
		  set t_Co=256
endif

if &t_Co >= 256 || has("gui_running")
		colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
		" switch syntax highlighting on, when the terminal has colors
		syntax on
endif

" Invisible characters
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F3>

" Map for efficiency, maps : to ; but as i'm on a spanish keyboard is .
" instead
nnoremap . :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Stop using the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" With line wrapping enabled, this solves the problem that pressing down
" jumpes your cursor “over” the current line to the next line
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tired of clearing highlighted searches by searching for “ldsfhjkhgakjks”? Use this:
nmap <silent> ,/ :nohlsearch<CR>

" If you forgot to sudo before editing
cmap w!! w !sudo tee % >/dev/null

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#bundles-i-use
inoremap jj <ESC>

" ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
