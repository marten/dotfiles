(autoload 'dash-at-point "dash-at-point" "Search the word at point with Dash." t nil)

(add-to-list 'dash-at-point-mode-alist '(enh-ruby-mode . "ruby"))
(global-set-key (kbd "C-c d") 'dash-at-point)

(provide 'init-dash-at-point)
