function! yamlfolds#YamlFolds()
  let previous_level = indent(prevnonblank(v:lnum - 1)) / &shiftwidth
  let current_level = indent(v:lnum) / &shiftwidth
  let next_level = indent(nextnonblank(v:lnum + 1)) / &shiftwidth

  if getline(v:lnum + 1) =~ '^\s*$'
    return "="

  elseif current_level < next_level
    return next_level

  elseif current_level > next_level
    return ('s' . (current_level - next_level))

  elseif current_level == previous_level
    return "="

  endif

  return next_level
endfunction

function! yamlfolds#YamlFoldText()
  let lines = v:foldend - v:foldstart
  "remove ANSI terminal control characters
  let first_line = substitute(getline(v:foldstart), '\e\[[0-9;]\+[mK]', '', 'g')
  return first_line . '   (level ' . v:foldlevel . ', lines ' . lines . ')'
endfunction

"define custom fold text for JSON files
function! yamlfolds#JsonFoldText()
  let lines = v:foldend - v:foldstart
  "remove ANSI terminal control characters
  let first_line = substitute(getline(v:foldstart), '\e\[[0-9;]\+[mK]', '', 'g')
  return first_line . '   (level ' . v:foldlevel . ', lines ' . lines . ')'
endfunction
