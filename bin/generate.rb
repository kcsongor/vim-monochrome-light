#!/usr/bin/env ruby

# Mapping guidelines:
#
#   http://raebear.net/comp/emacscolors.html
#   http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
#

def white
  { gui: 'White', cterm: 15  }
end

def black
  { gui: 'Black', cterm: 16 }
end

def bgray
  { gui: '#202020', cterm: 234 }
end

def lineNr
  { gui: '#202020', cterm: 238 }
end

def lgray
  { gui: 'LightGray', cterm: 252 }
end

def llgray
  { gui: 'LightGray', cterm: 255 }
end

def cgray
  { gui: '#737373', cterm: 249 }
end

def dgray
  { gui: 'DarkGray', cterm: 248 }
end

def sblue
  { gui: '#778899', cterm: 124}
end

def blue
  { gui: '#778899', cterm: 20}
end

def yellow
  { gui: 'Yellow', cterm: 226 }
end

def none
  { gui: 'NONE', cterm: 'NONE' }
end

def red
  { gui: 'Red', cterm: 1 }
end

def hi(group, options={})
  tokens = []
  tokens << 'hi'
  tokens << group.to_s

  fg = options.delete(:fg) {|_| black }
  tokens << "guifg=#{fg[:gui]}"
  tokens << "ctermfg=#{fg[:cterm]}"

  bg = options.delete(:bg) {|_| white }
  tokens << "guibg=#{bg[:gui]}"
  tokens << "ctermbg=#{bg[:cterm]}"

  rest = options.keys.join(',')
  rest = 'NONE' if rest.empty?
  tokens << "gui=#{rest}"
  tokens << "cterm=#{rest}"
  tokens << "term=#{rest}"

  puts tokens.join(' ')
end

puts <<-EOS
" Vim color scheme
"
" This file is generated, please check bin/generate.rb.
"
" Name:       monochrome.vim
" Maintainer: Xavier Noria <fxn@hashref.com> 
" License:    MIT

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'monochrome'

" These commands are generated, see bin/generate.rb.
EOS

# Basic colors.
hi :Normal
hi :Cursor, fg: white, bg: lgray

# Cursor line.
hi :CursorLine, fg: none, bg: lgray
hi :CursorLineNr, fg: black, bold: true

# Diff
hi :diffAdded, fg: sblue, bg: black
hi :diffRemoved, fg: red, bg: black

hi :DiffAdd,    fg: sblue,   bg: llgray
hi :DiffChange, fg: blue,    bg: llgray
hi :DiffDelete, fg: red,     bg: llgray
hi :DiffText,   fg: red,     bg: llgray, bold: true

# Folding.
hi :FoldColumn, fg: dgray
hi :Folded

# Tab bar.
hi :TabLine, bg: lgray
hi :TabLineFill, fg: lgray, bg:white
hi :TabLineSel, fg: white, bg: black

# Status bar.
hi :StatusLine, fg: white, bg: black
hi :StatusLineNC, fg: cgray, bg: black

# Mark column.
hi :SignColumn, bg: black 

# Vert split bar.
hi :VertSplit, fg: black, bg: white, bold: true

# 80 char column.
hi :ColorColumn, bg: llgray

# Line numbers gutter.
hi :LineNr, fg: lineNr

# Main groups for programming langages.
hi :Statement, fg: black, bold: true
hi :PreProc, fg: black, bold: true
hi :String, fg: sblue, bold: true
hi :Comment, fg: cgray
hi :Constant
hi :Type, fg: black, bold: true
hi :Function, fg: black
hi :Identifier
hi :Special
hi :MatchParen, fg: lgray, bg: lgray, :underline => true

hi :Conceal, fg: black, bg: lgray, bold: true

# Ruby tweaks.
hi :rubyConstant
hi :rubySharpBang, fg: cgray
hi :rubyStringDelimiter, fg: sblue
hi :rubyStringEscape, fg: sblue
hi :rubyRegexpEscape, fg: sblue
hi :rubyRegexpAnchor, fg: sblue
hi :rubyRegexpSpecial, fg: sblue

# Perl tweaks.
hi :perlSharpBang, fg: cgray
hi :perlStringStartEnd, fg: sblue
hi :perlStringEscape, fg: sblue
hi :perlMatchStartEnd, fg: sblue

# Python tweaks.
hi :pythonEscape, fg: sblue

# JavaScript tweaks.
hi :javaScriptFunction, fg: black, bold: true

# Elixir tweaks.
hi :elixirDelimiter, fg: sblue

# Search.
hi :Search, fg: white, bg: sblue
hi :Visual, fg: white, bg: black

# Tildes at the bottom of a buffer, etc.
hi :NonText, fg: dgray

# File browsers.
hi :Directory, fg: black, bold: true

# Markup.
hi :Title, fg: black, bold: true
hi :markdownHeadingDelimiter, fg: black, bold: true
hi :markdownHeadingRule, fg: black, bold: true
hi :markdownLinkText, fg: sblue, underline: true

# Notes.
hi :Todo, fg: lgray, bg: yellow, bold: true

# Popup menu.
hi :Pmenu, fg: black, bg: sblue
hi :PmenuSel, fg: sblue, bg: black

# Help.
hi :helpSpecial
hi :helpHyperTextJump, fg: sblue, underline: true
hi :helpNote # linked to Todo

# Vim script.
hi :vimOption
hi :vimGroup
hi :vimHiClear
hi :vimHiGroup
hi :vimHiAttrib
hi :vimHiGui
hi :vimHiGuiFgBg
hi :vimHiCTerm
hi :vimHiCTermFgBg
hi :vimSynType
hi :vimCommentTitle, fg: cgray

