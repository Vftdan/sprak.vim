setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal commentstring=#%s

let b:match_words = '\<\%(\(\<else\s\+\)\@<!if\|loop\|\%(void\|number\|string\|var\|array\|bool\)\>\s*\k\+\s*(\@=\):\<\%(else\%(\s\+if\)\?\|return\|break\)\>:\<end\>'
