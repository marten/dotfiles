;; Package management

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(require 'init-packages)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-powerline"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/smartparens"))

(cd "~/")

; Necessities
(require 'init-core)    ; Core setup
(require 'init-util)    ; Provides utility functions
(require 'init-theme)   ; Sets up the theme
(require 'init-visuals) ; Hides mode-line clutter, sets up visual aspects of Emacs
(require 'init-evil)    ; VI-emulation
(require 'init-keys)

; Editor improvements
(require 'init-powerline)
(require 'init-ido)
(require 'init-autocomplete)
(require 'init-projectile)
(require 'init-yasnippet)
(require 'init-magit)

; Languages
(require 'init-ruby)

;init-highlight-indentation
;init-dash-at-point
;; init-find-file-in-project
;init-smartparens

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("99cbc2aaa2b77374c2c06091494bd9d2ebfe6dc5f64c7ccdb36c083aff892f7d" default)))
 '(fill-column 85))
