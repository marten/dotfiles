__trap_exit_tmux() {
  # if not inside tmux, exit normally
  if [[ -v TMUX ]]; then
    # fish: test (tmux list-windows | wc -l) = 1 || exit
    if [[ $(tmux list-windows | wc -l) -ne 1 ]]; then
      exit
    fi

    # fish: test (tmux list-panes | wc -l) = 1 || exit
    if [[ $(tmux list-panes | wc -l) -ne 1 ]]; then
      exit
    fi

    tmux switch-client -t default
  fi

  exit
}

[[ $- == *i* ]] && trap __trap_exit_tmux EXIT

