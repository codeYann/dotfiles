vim.cmd([[
try 
  colorscheme github_*
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
