set nocompatible
syntax on
" from Perl Best Practices:
" Changing to puppet style with 2-column tabs
" http://docs.puppetlabs.com/guides/style_guide.html
set tabstop=2           "An indentation level every two columns"
set expandtab           "Convert all tabs to spaces"
set shiftwidth=2        "Indent/outdent by 2"
set shiftround          "Always indent/outdent to nearest tabstop"
"set backup             " keep a backup file

set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" Recommended .vimrc from 
" http://wiki.rubyonrails.org/rails/pages/HowtoUseVimWithRails
" === start ===
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
" Clear old autocmds in group
autocmd!
" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml set ci sw=4 sts=2 et
augroup END
" === end ===

" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set lbr

" == start  http://maatkit.googlecode.com/svn/wiki/CodingStandards.wiki ==
set autoindent                    "Preserve current indent on new lines
set textwidth=78                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly
 
set matchpairs+=<:>               "Allow % to bounce between angles too

set iskeyword+=:                  "Perl double colons are valid part of
                                  "identifiers.

set number

set statusline=%<%f%h%m%r%=%{&ff}\ %l,%c%V\ %P

filetype plugin on

"reread .vimrc file after editing
autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc

" use visual bell instead of beeping
set vb

" syntax highlighting
" set bg=light
set bg=dark
syntax on

" autoindent
autocmd FileType perl set autoindent|set smartindent

" show matching brackets
autocmd FileType perl set showmatch

" check perl code with :make
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" Tlist Config
nnoremap <silent> <F8> :TlistToggle<CR>

" perltidy mappings
map <F2> <ESC>:%! perltidy<CR>
map <F3> <ESC>:'<,'>! perltidy<CR>

" Perl test files as Perl code
au BufRead,BufNewFile *.t set ft=perl


" Don't use Ex mode, use Q for formatting
map Q gq

" Insert Puppet disclaimer
iab abpuppet 
            \<CR># **************************** NOTICE ****************************
            \<CR># * This file is centrally managed by the Puppet configuration
            \<CR># * management system.  Any changes made locally will be overriden 
            \<CR># * on the next run of Puppet. To permanently effect a change,
            \<CR># * contact your system administration team, 
            \<CR># *           CloudOps@audaxhealth.com
            \<CR># **************************** NOTICE ****************************

