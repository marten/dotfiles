function vim --wraps=nvim --description 'alias vim direnv exec / nvim'
  direnv exec / nvim $argv
end
