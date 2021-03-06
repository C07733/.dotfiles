local base16 = require('base16')

-- themes
local gr8 = base16.theme_from_array {
	"1A1A1A"; "262626"; "262626"; "333333";
	"E6E6E6"; "E6E6E6"; "E6E6E6"; "E6E6E6";
  "ff664c"; "feff64"; "feff64"; "40c561";
	"18d4b4"; "7cb1ef"; "f980f0"; "d9d9d9";
}

-- base16(base16.themes["classic-dark"], true) -- to use default base16-themes
base16(gr8, true)

-- higlights
vim.cmd [[
  exe "hi StatusInactive guibg=background guifg=".g:terminal_color_8 
  exe "hi StatusNormal guifg=background guibg=".g:terminal_color_2
  exe "hi StatusReplace guifg=background guibg=".g:terminal_color_1
  exe "hi StatusInsert guifg=background guibg=".g:terminal_color_2
  exe "hi StatusCommand guifg=background guibg=".g:terminal_color_3
  exe "hi StatusVisual guifg=background guibg=".g:terminal_color_4
  exe "hi StatusTerminal guifg=background guibg=".g:terminal_color_5

  exe "hi NvimTreeGitDirty guifg=".g:terminal_color_1
  exe "hi NvimTreeGitNew guifg=".g:terminal_color_2
  exe "hi NvimTreeGitDeleted guifg=".g:terminal_color_1
  exe "hi NvimTreeGitRenamed guifg=".g:terminal_color_3
  exe "hi NvimTreeSpecialFile guifg=".g:terminal_color_5
  exe "hi NvimTreeExecFile guifg=".g:terminal_color_2
  exe "hi NvimTreeImageFile guifg=".g:terminal_color_7

  hi EndOfBuffer guifg=background 
  hi LineNr guibg=background
  hi SignColumn guibg=background
  hi VertSplit guibg=background

  hi! link TabLineSel StatusInsert
  hi TabLine guibg=background
  hi TabLineFill guibg=background

  hi FoldColumn guibg=background                                                                         
  hi DiffAdd guibg=background                                                                         
  hi DiffChange guibg=background                                             
  hi DiffDelete guibg=background                                                                
  hi DiffText guibg=background
]]
