;;;  -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Input Mono Narrow" :size 16)
      doom-big-font (font-spec :family "Input Mono Narrow" :size 25))

(require 'org-projectile)
(org-projectile-per-project)
(setq org-projectile-per-project-filepath "my_project_todo_filename.org")
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
; (global-set-key (kbd "C-c c") 'org-capture)
; (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)

(setq doom-localleader-key ",")

(map! (:after ruby-mode
        :map ruby-mode-map
        :n "C-c C-c" #'seeing-is-believing))

(map! :v "Q" 'fill-region)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(map! :nvoi "C-z" #'suspend-frame)
(map! :n "ga" #'projectile-toggle-between-implementation-and-test
      :n ";" #'evil-ex
      :n ",," #'switch-to-previous-buffer)

(map! :leader
      (:desc "Project" :prefix "p"
        :desc "Switch between implementation and test file" :n "a" #'projectile-toggle-between-implementation-and-test))

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (add-to-list 'ruby-mode-hook (lambda () (setq zeal-at-point-docset '("ruby" "rails"))))
    (map! :nv "g?" #'zeal-at-point))))

(customize-set-variable 'inf-ruby-console-environment "development")
