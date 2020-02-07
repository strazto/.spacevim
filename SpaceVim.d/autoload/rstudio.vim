function! rstudio#after() abort
  " Build and install
  noremap <F5>b :call SpaceVim#plugins#runner#open('R CMD INSTALL --no-multiarch --with-keep.source .')<CR>
  " Run tests
  noremap <F5>t :call SpaceVim#plugins#runner#open('Rscript --no-save --no-restore -e devtools::test()')<CR>
endfunction

