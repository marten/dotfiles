;; Package management
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-powerline"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/smartparens"))

(load-theme 'monokai t)

(cd "~/")

(mapcar 'require
 	'(init-core
     ; init-theme
     init-keys
     init-ido
     init-autocomplete
     init-highlight-indentation
     init-dash-at-point
     ; init-find-file-in-project
     init-projectile
     init-powerline
     init-smartparens
     init-evil
     init-ruby
 	  ))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("99cbc2aaa2b77374c2c06091494bd9d2ebfe6dc5f64c7ccdb36c083aff892f7d" default)))
 '(fill-column 85))