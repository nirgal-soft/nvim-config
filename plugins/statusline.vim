"file name
set statusline=%t
"is file saved
set statusline+=%m
"current line/total lines
set statusline+=%=%l/%L
"fugitive status line
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
