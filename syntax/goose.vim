let b:current_syntax = "banana"

" Comments
syn region comment start="\v#" end="$" contains=TODO 

syn keyword TODO TODO FIXME XXX NOTE UNIMPLEMENTED

syn keyword keywords null


" Banana Function
syn match funcDef 'def' nextgroup=funcName
syn match funcName ' [A-z][A-z0-9]*' contained skipwhite nextgroup=funcArgs, funcBody

syn keyword funcArgs takes contained skipwhite nextgroup=funcArg 

syn match funcArg '\v[A-z][A-z0-9]*' contained skipwhite nextgroup=funcArgType
syn match funcArgType '[A-z][A-z0-9]*[\*]*' contained skipwhite nextgroup=funcBody, funcArgSeperator

syn match funcArgSeperator ',' contained skipwhite nextgroup=funcArg
syn region funcBody start="{" end="}" contained transparent skipwhite contains=statementVar

syn keyword statementVar mem const contained skipwhite nextgroup=statementVarIdentifier

syn match statementVarIdentifier '\v[A-z][A-z0-9]*' contained transparent skipwhite nextgroup=statementVarType
syn match statementVarType '\v[A-z][A-z0-9]*[\*]*' skipwhite contained nextgroup=statementEnd, statementAssignment

syn region statementAssignment start='\v[+-\*\/]\==' end=';' transparent skipwhite contained contains=operator, numberLit, functionCall

syn region functionCall start='\v[A-z][A-z0-9]*\(' end=')' contained transparent skipwhite contains=functionIdentifier, operator, numberLit
syn match functionIdentifier '\v[A-z][A-z0-9]*' contained skipwhite

syn match numberLit '\v\d+[fid]?' skipwhite contained
syn match numberLit '\v\d+\.\d*[fid]?' skipwhite contained

"syn match operator ';' skipwhite contained
syn match operator '=' skipwhite contained
syn match operator '+' skipwhite contained
syn match operator '+=' skipwhite contained
syn match operator '-' skipwhite contained
syn match operator '-=' skipwhite contained
syn match operator '*' skipwhite contained
syn match operator '*=' skipwhite contained
syn match operator '/' skipwhite contained
syn match operator '/=' skipwhite contained

hi def link functionIdentifier Function
hi def link numberLit Number
hi def link operator Operator

hi def link statementVar Statement
hi def link statementVarIdentifier Transparent
hi def link statementVarType Type

hi def link comment Comment
hi def link TODO Todo
hi def link keywords Keyword

hi def link funcDef Keyword
hi def link funcName Function
hi def link funcArgs Statement

hi def link funcArg Identifier
hi def link funcArgType Type
hi def link funcArgSeperator Operator
