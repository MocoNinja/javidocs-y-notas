# Notas de instalación

## Programas

### VIM

#### Alias para powershell

`Set-Alias -Name vim -Value "C:\Program Files\Vim\vim91\vim.exe"`

#### Vim rc en windows


1. Crear fichero si no existe en `if (!(Test-Path ~\_vimrc)) { New-Item ~\_vimrc }`
1. Ejemplo de lo que tengo ejecutando `Get-Content C:\Users\Javier\_vimrc`

```vimrc
" --- GENERAL SETTINGS ---
set nocompatible            " Disable compatibility with old Vi
set encoding=utf-8          " Set internal character encoding
set number                  " Show line numbers
set relativenumber          " Hybrid line numbers (great for jumping)
set mouse=a                 " Enable mouse support in all modes
set clipboard=unnamed       " Use Windows clipboard for copy/paste
set history=1000            " Remember more commands

" --- UI & APPEARANCE ---
syntax on                   " Enable syntax highlighting
set cursorline              " Highlight the line the cursor is on
set showmatch               " Highlight matching brackets
set termguicolors           " Enable 24-bit RGB colors if your terminal supports it
colorscheme darkblue

" --- TABS & INDENTATION ---
set tabstop=4               " Render tabs as 4 spaces
set softtabstop=4           " Insert 4 spaces when hitting Tab
set autoindent              " Copy indent from current line when starting a new one
set smartindent             " Be smart about C-style indentation

" --- SEARCHING ---
set hlsearch                " Highlight search results
set incsearch               " Search as you type
set ignorecase              " Ignore case when searching...
set smartcase               " ...unless you use a capital letter

" --- WINDOWS FIXES ---
set backspace=indent,eol,start  " Make backspace work like a normal editor
set noswapfile              " Don't create those annoying .swp files
set nobackup                " Don't create backup files
set undodir=~/.vim/undodir  " Keep undo history in one place
set undofile                " Maintain undo history between sessions

" --- C++ SPECIFIC ---
" Compile and Run shortcut (Press F5 to compile with cl.exe and run)
autocmd FileType cpp nnoremap <F5> :w <bar> !cl /EHsc % && %:r.exe<CR>

" --- KEY MAPS ---
" Map Leader to space (much easier than the default backslash)
let mapleader = " "

" Fast save
nmap <leader>w :w<cr>

" Clear search highlights with Esc
nnoremap <esc> :noh<return><esc>
```

