(require-package 'project-explorer)

(evil-define-key 'normal project-explorer-mode-map
  (kbd "<return>") 'pe/return
  "o" (lambda ()
        (interactive)
        (if (string/ends-with (pe/user-get-filename) "/")
            (pe/tab)
          (pe/return)))
  "r" 'revert-buffer)

(provide 'init-project-explorer)
