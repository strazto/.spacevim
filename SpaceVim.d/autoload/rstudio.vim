function! rstudio#after() abort
  " set <M-->=^[-
  " let g:R_assign_map = '<M-->'
  let g:R_assign = 2
  " Build and install
  noremap <F5>b :call SpaceVim#plugins#runner#open('R CMD INSTALL --no-multiarch --with-keep.source .')<CR>
  " Run tests
  noremap <F5>t :call SpaceVim#plugins#runner#open('Rscript --no-save --no-restore -e devtools::test()')<CR>
  autocmd BufNewFile,BufRead *.mustache set filetype=r

"  let g:tagbar_type_r = {
"    \ 'ctagstype' : 'r',
"    \ 'kinds'     : [
"          \ 'f:Functions',
"          \ 'g:GlobalVariables',
"          \ 'v:FunctionVariables',
"      \ ]
"  \ }

  let g:tagbar_ctags_bin = '/snap/bin/universal-ctags'
  set clipboard=unnamedplus

  call SpaceVim#mapping#space#def('nnoremap', ['p', 'y'], 'call SpaceVim#util#CopyToClipboard(3)', 'copy-permalink-to-line', 1)
  let g:neomake_c_clang_exe = "mpicc"
  
  "let g:airline_theme='jellybeans'
  "let g:lightline = { 'colorscheme': 'jellybeans' }
  
  let g:markdown_syntax_conceal = 0
endfunction

function! rstudio#before() abort
  " Tmux Navigator bindings

  let g:tmux_navigator_no_mappings = 1

  nnoremap <silent> <C-Left>  :<C-U>TmuxNavigateLeft<CR>
  nnoremap <silent> <C-Down>  :<C-U>TmuxNavigateDown<CR>
  nnoremap <silent> <C-Up>    :<C-U>TmuxNavigateUp<CR>
  nnoremap <silent> <C-Right> :<C-U>TmuxNavigateRight<CR>
  
  " Handle xTerm keymappings
  if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

endfunction
