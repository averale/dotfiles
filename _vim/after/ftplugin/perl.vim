" Abreviations
"=============
ab pperl #!/usr/bin/env perl<CR><CR>use strict;<CR>use warnings;<CR>

"iab dbg use Data::Dumper qw( Dumper );warn Dumper [];hi
iab dbg use Data::Dumper qw( Dumper );<CR>warn Dumper [];<ESC>hi

" Tide up Perl code using Perltidy
" map <silent> <F5> :!perltidy -i=4 -et=4 -l=78 -pt=2 -sbt=2 -bbt=2<CR>
" Make sure that you ~/.perltidyrc is exists and valid!
map <silent> <F5> :!perltidy --check-syntax<CR>

" save and run current script
nmap ZR :w<CR>:!./%<CR>

" Editor settings
"================
" old settings
"set tabstop=2 | set shiftwidth=2 |set noexpandtab

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
