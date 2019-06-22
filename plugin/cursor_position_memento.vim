" File: plugin/cursor_position_memento.vim
" Author: Toru Hoyano <toru.iwashita@gmail.com>
" License: MIT License

if exists('g:cursor_position_memento')
  finish
endif
let g:cursor_position_memento = 1

let s:cpoptions_save = &cpoptions
set cpoptions&vim

command! SaveSpecificCursorPos call cursor_position_memento#save_specific_cursor_position()
command! LoadSpecificCursorPos call cursor_position_memento#load_specific_cursor_position()

let &cpoptions = s:cpoptions_save
unlet s:cpoptions_save
