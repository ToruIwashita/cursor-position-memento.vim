" File: autoload/cursor_position_memento.vim
" Author: Toru Hoyano <toru.iwashita@gmail.com>
" License: MIT License

let s:cpoptions_save = &cpoptions
set cpoptions&vim

function! cursor_position_memento#save_specific_cursor_position() abort
  let g:cursor_position_memento_specific_cursor_pos = getpos('.')
  let g:cursor_position_memento_specific_window_num = winnr()
  let g:cursor_position_memento_specific_tab_num = tabpagenr()
endfunction

function! cursor_position_memento#load_specific_cursor_position() abort
  if !exists('g:cursor_position_memento_specific_tab_num')
    return 1
  endif

  execute 'tabnext'.g:cursor_position_memento_specific_tab_num
  execute g:cursor_position_memento_specific_window_num.'wincmd w'
  call setpos('.', g:cursor_position_memento_specific_cursor_pos)
endfunction

let &cpoptions = s:cpoptions_save
unlet s:cpoptions_save
