" =================================================================
" vim-cursorholdmark - Mark position after typing
"
" This plugin is licensed MIT: {{{
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to
" deal in the Software without restriction, including without limitation the
" rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
" sell copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.
" }}}
" =================================================================

if exists("g:loaded_cursorholdmark")
  finish
endif

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:cursorholdmark_mark')
  let g:cursorholdmark_mark = 'a'
endif
if !exists('g:cursorholdmark_time')
  let g:cursorholdmark_time = 4000
endif

augroup CursorHoldMarkGroup
  autocmd!
  autocmd CursorMoved * call cursorholdmark#start_timer()
  autocmd User CursorHoldMarked call cursorholdmark#nop()
augroup END


let &cpo = s:save_cpo
let g:loaded_cursorholdmark = 1
unlet s:save_cpo

" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:
