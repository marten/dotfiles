# AutoJump
#[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

if [ -d ~/bin ]
  set PATH $HOME/bin $PATH
end

if [ -d $HOME/.cargo/bin ]
  set PATH $HOME/.cargo/bin $PATH
end

if [ -d $HOME/.emacs.d/bin ]
  set PATH $HOME/.emacs.d/bin $PATH
end

set -x LC_ALL en_US.UTF-8
set LANG en_US

# may be slow?
source /usr/local/opt/asdf/libexec/asdf.fish

starship init fish | source
