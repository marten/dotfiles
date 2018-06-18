(require-package 'yasnippet)

(require 'yasnippet)

(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "snippets"))
(yas-reload-all)


(provide 'init-yasnippet)
