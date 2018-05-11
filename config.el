;;;  -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Input Mono Narrow" :size 12)
      doom-big-font (font-spec :family "Input Mono Narrow" :size 25))

(require 'org-projectile)
(org-projectile-per-project)
(setq org-projectile-per-project-filepath "my_project_todo_filename.org")
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
; (global-set-key (kbd "C-c c") 'org-capture)
; (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)



(map! (:after ruby-mode
        :map ruby-mode-map
        :n "C-c C-c" #'seeing-is-believing))
