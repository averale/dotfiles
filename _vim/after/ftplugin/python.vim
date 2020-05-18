" Abreviations
"=============

" save and run current script
nmap ZR :w<CR>:!python3 ./%<CR>
nmap ZT :w<CR>:!time python3 ./%<CR>
nmap ZP :w<CR>:!prove ./%<CR>

" Editor settings
"================
" Maximizes the usable width of each code line whilst ensuring that those lines
" appear consistently on the vast majority of display devices
set textwidth=78

" An indentation level every four columns
set tabstop=4      

" Convert all tabs typed into spaces
set expandtab      

" Indent/outdent by four columns
set shiftwidth=4   

" Always indent/outdent to the nearest tabstop
set shiftround     

" We need numbering in program sources
set nu

" Tide up Python code using ...
" map <silent> <F5> :!perltidy -i=4 -et=4 -l=78 -pt=2 -sbt=2 -bbt=2<CR>
" Make sure that you ~/.perltidyrc is exists and valid!
"map <silent> <F5> :!perltidy --check-syntax<CR>

filetype plugin indent on
" External program to use for "=" command
" now select the text you want to format, then hit =. You can reformat the
" entire file with 1G=G
"autocmd FileType perl setlocal equalprg=perltidy\ -pbp\ -st
autocmd FileType python setlocal equalprg=yapf

" Format file with perltidy...
nmap ;p 1G!Gyapf<CR>

" Show what changes perltidy would make...
" Perltidy_diff function itself are moved to .vimrc
nmap ;pp :call Perltidy_diff()<CR>

