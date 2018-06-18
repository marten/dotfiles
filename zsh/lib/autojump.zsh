if (( $+commands[brew] )) ; then
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
