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

let s:cpo_save = &cpo
set cpo&vim


function! cursorholdmark#start_timer() abort
  call cursorholdmark#stop_timer()
  let s:timer_id = timer_start(g:cursorholdmark_time, 'cursorholdmark#marking')
endfunction

function! cursorholdmark#stop_timer() abort
  if exists('s:timer_id')
    call timer_stop(s:timer_id)
    unlet! s:timer_id
  endif
endfunction

function! cursorholdmark#marking(id) abort
  if &buftype == ''
    execute 'normal! m'..g:cursorholdmark_mark
    doautocmd User CursorHoldMarked
  endif
  unlet! s:timer_id
endfunction

function! cursorholdmark#nop()
  " do nothing
endfunction


let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:
