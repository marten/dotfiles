# AutoJump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

if [ -d ~/bin ]
  set PATH $HOME/bin $PATH
end

if [ -d ~/.rbenv ]
  set PATH $HOME/.rbenv/bin $PATH
  set PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end

if [ -d $HOME/.emacs.d/bin ]
  set PATH $HOME/.emacs.d/bin $PATH
end

set -x LC_ALL en_US.UTF-8
set LANG en_US
