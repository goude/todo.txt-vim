" File:        todo.txt.vim
" Description: Todo.txt syntax settings
" Author:      Leandro Freitas <freitass@gmail.com>
" License:     Vim license
" Website:     http://github.com/freitass/todo.txt-vim
" Version:     0.3

if exists("b:current_syntax")
    finish
endif

syntax  match  TodoDone       '^[xX]\s.\+$'

syntax  match  TodoPriorityA  '^([aA])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate,TodoTag
syntax  match  TodoPriorityB  '^([bB])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate,TodoTag
syntax  match  TodoPriorityC  '^([cC])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate,TodoTag

syntax  match  TodoDate       '\d\{2,4\}-\d\{2\}-\d\{2\}' contains=NONE
syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'  contains=NONE
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'  contains=NONE

syntax  match  TodoTag    '\(^\|\W\)[a-z0-9-]\+:[a-z0-9-]\+'  contains=OverDueDate,TodoDate

"syntax  match  TodoContextSparetime  '^.\+@sparetime.*$'
"highlight  default  link  TodoContextSparetime  Comment

" Other priority colours might be defined by the user
highlight  default  link  TodoDone              Comment
highlight  default  link  TodoPriorityA         Constant
highlight  default  link  TodoPriorityB         Statement
highlight  default  link  TodoPriorityC         Identifier
highlight  default  link  TodoDate              PreProc
highlight  default  link  TodoProject           Special
highlight  default  link  TodoContext           Constant
highlight  default  link  TodoTag               Comment
highlight  default  link  OverDueDate           Statement

if exists('g:todo_load_python') && g:todo_load_python
    if has('python')
        let b:curdir = expand('<sfile>:p:h')
        let s:script_dir = b:curdir . "/python/"
        execute "pyfile " . s:script_dir. "todo.py"
    elseif has('python3')
        let b:curdir = expand('<sfile>:p:h')
        let s:script_dir = b:curdir . "/python/"
        execute "py3file " . s:script_dir. "todo.py"
    else
        echom "Your version of vim has no python support. Overdue dates won't be highlighted"
    endif
endif

let b:current_syntax = "todo"
