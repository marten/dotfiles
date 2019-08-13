"let test#ruby#rspec#options = '--require $HOME/.config/nvim/rspec_formatter.rb --format VimFormatter'
let test#ruby#rspec#options = '--format progress'

if executable('solargraph')
  " gem install solargraph
  au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif
