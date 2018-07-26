" Vim syntax file
" Language:	Spice circuit simulator input netlist
" Maintainer:	ftorres16
"
" This is based on https://github.com/1995parham/vim-spice

if exists("b:current_syntax")
	echom "Spice syntax won't be loaded"
	finish
endif

" spice syntax is case INsensitive
syn case ignore

syn keyword	spiceTodo	contained TODO

syn match spiceComment  "^ \=\*.*$" contains=@Spell,spiceTodo
syn match spiceComment  "\$.*$" contains=@Spell


" Numbers, all with engineering suffixes and optional units
" floating point number, with dot, optional exponent
syn match spiceNumber  "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
" floating point number, starting with a dot, optional exponent
syn match spiceNumber  "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
" integer number with optional exponent
syn match spiceNumber  "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="


" Elements
syn match spiceElement "^r\S*" " Resistors
syn match spiceElement "^c\S*" " Capacitor
syn match spiceElement "^l\S*" " Inductor
syn match spiceElement "^v\S*" " Independent voltage source
syn match spiceElement "^i\S*" " Independent current source
syn match spiceElement "^E\S*" " Voltage-controlled voltage source
syn match spiceElement "^H\S*" " Current-controlled voltage source
syn match spiceElement "^G\S*" " Voltage-controlled current source
syn match spiceElement "^F\S*" " Current-controlled current source
syn match spiceElement "^m\S*" " MOSFET
syn match spiceElement "^x\S*"
syn match spiceElement "^q\S*" " BJT
syn match spiceElement "^d\S*" " Diode


" Models
syn match spiceModel "\.model"
syn match spiceModel "\.malias"
syn keyword spiceModelType nmos pmos NPN PNP D njf pjf


" Subcircuits
syn match spiceSubCkt "\.ends"
syn match spiceSubCkt "\.eom"
syn match spiceSubCkt "\.include" 
syn match spiceSubCkt "\.macro"
syn match spiceSubCkt "\.model"
syn match spiceSubCkt "\.subckt"


" Analysis
syn match spiceAnal "\.ac"
syn match spiceAnal "\.dc"
syn match spiceAnal "\.dcmatch"
syn match spiceAnal "\.disto"
syn match spiceAnal "\.fft"
syn match spiceAnal "\.four"
syn match spiceAnal "\.lin"
syn match spiceAnal "\.net"
syn match spiceAnal "\.noise"
syn match spiceAnal "\.op"
syn match spiceAnal "\.pat"
syn match spiceAnal "\.pz"
syn match spiceAnal "\.sample"
syn match spiceAnal "\.sense"
syn match spiceAnal "\.temp"
syn match spiceAnal "\.tf"
syn match spiceAnal "\.tran"


" Simulation Runs
syn match spiceAnal "\.end"
syn match spiceAnal "\.temp"
syn match spiceAnal "\.title"


" Library Management
syn match spiceLibManagement "\.del lib"
syn match spiceLibManagement "\.endl"
syn match spiceLibManagement "\.include"
syn match spiceLibManagement "\.lib"
syn match spiceLibManagement "\.protect"
syn match spiceLibManagement "\.unprotect"


" Output
syn match spiceOutput "\.biaschk"
syn match spiceOutput "\.dout"
syn match spiceOutput "\.graph"
syn match spiceOutput "\.measure"
syn match spiceOutput "\.plot"
syn match spiceOutput "\.print"
syn match spiceOutput "\.probe"
syn match spiceOutput "\.stim"
syn match spiceOutput "\.width"


" Setup
syn match spiceSetUp "\.data"
syn match spiceSetUp "\.dcvolt"
syn match spiceSetUp "\.enddata"
syn match spiceSetUp "\.global"
syn match spiceSetUp "\.ic"
syn match spiceSetUp "\.load"
syn match spiceSetUp "\.nodeset"
syn match spiceSetUp "\.option"
syn match spiceSetUp "\.param"
syn match spiceSetUp "\.save"
syn match spiceSetUp "\.title"


" Conditionals
syn match spiceConditional "\.if"
syn match spiceConditional "\.elseif"
syn match spiceConditional "\.else"
syn match spiceConditional "\.endif"


" Functions
" Sinusoidal source
syn keyword spiceFunc sin
" Square wave source
syn keyword spiceFunc pulse
" Piece-wise linear source
syn keyword spiceFunc pwl


" Misc
syn match   spiceWrapLineOperator       "\\$"
syn match   spiceWrapLineOperator       "^+"

" syn match   spiceStatement      "^ \=\.\I\+"


" Matching pairs of parentheses
syn region  spiceParen transparent matchgroup=spiceOperator start="(" end=")" contains=ALLBUT,spiceParenError
syn region  spiceSinglequote matchgroup=spiceOperator start=+'+ end=+'+


" Errors
syn match spiceParenError ")"


" Syncs
syn sync minlines=50


" Highlights
highlight link spiceWrapLineOperator	spiceOperator
highlight link spiceSinglequote	spiceExpr

highlight link spiceAnal		Keyword		
highlight link spiceComment		Comment
highlight link spiceConditional		Conditionl
highlight link spiceElement		Define
highlight link spiceExpr		Function
highlight link spiceFunc		Function
highlight link spiceLibManagement	Define
highlight link spiceModel		Structure
highlight link spiceModelType		Type
highlight link spiceNumber		Number
highlight link spiceOperator		Operator
highlight link spiceOutput		Statement
highlight link spiceSetUp		Define
highlight link spiceSubCkt		Structure
highlight link spiceStatement		Statement
highlight link spiceTodo		Todo
highlight link spiceParenError		Error


let b:current_syntax = "spice"

" insert the following to $VIM/syntax/scripts.vim
" to autodetect HSpice netlists and text listing output:
"
" " Spice netlists and text listings
" elseif getline(1) =~ 'spice\>' || getline("$") =~ '^\.end'
"   so <sfile>:p:h/spice.vim

" vim: ts=8
