setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal commentstring=#%s

let b:match_words = '\c\<\%(\(\<else\s\+\)\@<!if\|loop\|\%(void\|number\|string\|var\|array\|bool\)\>\s*\k\+\s*(\@=\)\C:\c\<\%(else\%(\s\+if\)\?\|return\|break\)\>\C:\c\<end\>\C'
