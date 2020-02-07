function! rstudio#after() abort
  " Build and install
  noremap <silent> <S-F1>b :call SpaceVim#plugins#runner#open('R CMD INSTALL --no-multiarch --with-keep.source .')
  " Run tests
  noremap <silent> <S-F1>t :call SpaceVim#plugins#runner#open('Rscript --no-save --no-restore -e devtools::test()')
endfunction

