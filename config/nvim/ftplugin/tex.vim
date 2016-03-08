setlocal wrap      " Wrap lines
setlocal linebreak " Break lines at word boundaries

map <leader>t  :w\|!rubber -d %<cr>
