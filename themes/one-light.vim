" =============================================================================
" Filename: autoload/lightline/colorscheme/one.vim
" Author: Zoltan Dalmadi
" License: MIT License
" Last Change: 2017/11/28 21:53:01.
" =============================================================================

" Common colors
let s:fg     = [ '#abb2bf', 145 ]
let s:blue   = [ '#61afef', 75 ]
let s:green  = [ '#98c379', 76 ]
let s:purple = [ '#c678dd', 176 ]
let s:red1   = [ '#e06c75', 168 ]
let s:red2   = [ '#be5046', 168 ]
let s:yellow = [ '#e5c07b', 180 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:bg2 = [ '#051326', 255]

" Light variant
let s:bg     = [ '#1e345d', 255 ]
let s:gray1  = [ '#494b53', 238 ]
let s:gray2  = [ '#fafafa', 255 ]
let s:gray3  = [ '#d0d0d0', 250 ]
let s:green  = [ '#98c379', 35 ]

let s:p.normal.left     = [ [ s:bg, s:green, 'bold' ], [ s:gray2, s:bg, 'bold' ] ]
let s:p.normal.middle   = [ [ s:gray2, s:bg ] ]
let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
let s:p.inactive.middle = [ [ s:gray2, s:gray3 ] ]
let s:p.inactive.right  = [ [ s:bg, s:gray3 ], [ s:bg, s:gray3 ] ]
let s:p.insert.left     = [ [ s:bg, s:blue, 'bold' ], [ s:gray2, s:bg, 'bold' ] ]
let s:p.replace.left    = [ [ s:bg, s:red1, 'bold' ], [ s:gray2, s:bg, 'bold' ] ]
let s:p.visual.left     = [ [ s:bg, s:purple, 'bold' ], [ s:gray2, s:bg, 'bold' ] ]

" Common
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:bg, s:green, 'bold' ] ]
let s:p.normal.error   = [ [ s:red2,   s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:blue, 'bold' ], [ s:bg, s:blue, 'bold' ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:bg, s:red1, 'bold' ] ]
let s:p.visual.right   = [ [ s:bg, s:purple, 'bold' ], [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.left   = [ [ s:bg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:gray2, 'bold' ] ]
let s:p.tabline.middle = [ [ s:bg, s:gray3 ] ]
let s:p.tabline.right  = [ [ s:bg, s:gray3 ] ]

let g:lightline#colorscheme#one#palette = lightline#colorscheme#flatten(s:p)
