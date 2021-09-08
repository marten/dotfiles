function git-entr
  git ls-files -cdmo --exclude-standard | entr -d "$argv"
end

