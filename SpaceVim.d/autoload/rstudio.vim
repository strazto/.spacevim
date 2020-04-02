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
  

endfunction

function! rstudio#before() abort
  " Tmux Navigator bindings

  let g:tmux_navigator_no_mappings = 1

  nnoremap <silent><C-Left>  :<C-u>TmuxNavigateLeft<CR>
  nnoremap <silent><C-Down>  :<C-u>TmuxNavigateDown<CR>
  nnoremap <silent><C-Up>    :<C-u>TmuxNavigateUp<CR>
  nnoremap <silent><C-Right> :<C-u>TmuxNavigateRight<CR>
endfunction
