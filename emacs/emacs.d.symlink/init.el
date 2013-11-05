;; Package management
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(cd "~/")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(mapcar 'require
	'(init-core
    ; init-theme
    ; init-keys
    init-ido
    init-autocomplete
    ; init-find-file-in-project
    ; init-projectile
    ; init-powerline
	  init-evil
    init-ruby
	  ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 85))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
