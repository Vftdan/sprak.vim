" Vim indent file
" Language:     SPRAK scripting language used in else Heart.Break()
" Maintainer:   vftdan

" Only load this indent file when no other was loaded.
if exists('b:did_indent')
	finish
endif
let b:did_indent = 1

let s:INDENT_KEYWORD_PTN = '\<\%(if\|loop\|else\%(\s\+if\)\?\)\>'
let s:OUTDENT_KEYWORD_PTN = '\<\%(end\|else\)\>'
let s:FUNDECL_START_PTN = '\<\%(void\|number\|string\|var\|array\|bool\)\>\s*\k\+\s*('

function! s:is_not_comment(lnnum, matchind)
	if a:matchind < 0
		return v:false
	endif
	let l:synid = synID(a:lnnum, a:matchind + 1, 1)
	return synIDattr(l:synid, "name") != "sprakComment"
endfunction

function! indent#sprak#get_indent(lnnum)
	let l:plnum = prevnonblank(a:lnnum - 1)

	if l:plnum == 0
		" Start of file
		return 0
	endif

	let l:lvl = indent(l:plnum)
	let l:pline = getline(l:plnum)
	let l:line = getline(a:lnnum)

	let l:maybe_begin = match(l:pline, '^\c\s*\%\(' . s:INDENT_KEYWORD_PTN . '\|' . s:FUNDECL_START_PTN . '\)')
	if s:is_not_comment(l:plnum, l:maybe_begin)
		let l:lvl += shiftwidth()
	endif

	let l:maybe_end = match(l:line, '^\c\s*\%(' . s:OUTDENT_KEYWORD_PTN . '\)')
	if s:is_not_comment(a:lnnum, l:maybe_end)
		let l:lvl -= shiftwidth()
	endif

	return l:lvl
endfunction

setlocal indentexpr=indent#sprak#get_indent(v:lnum)
setlocal indentkeys+=0=~end,0=~else
setlocal autoindent
