# AutoJump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

if [ -d ~/.rbenv ]
  set PATH $HOME/.rbenv/bin $PATH
  set PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end

if [ -d $HOME/dotfiles/emacs.d/bin ]
  set PATH $HOME/dotfiles/emacs.d/bin $PATH
end
