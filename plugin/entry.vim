function! ActivateYamlFolds()
  setlocal foldmethod=expr
  setlocal foldexpr=yamlfolds#YamlFolds()
  setlocal foldtext=yamlfolds#YamlFoldText()
endfunction
