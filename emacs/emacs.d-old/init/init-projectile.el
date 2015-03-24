(require-package 'projectile)
(require-package 'grizzl)

(require 'projectile)
(require 'grizzl)

(projectile-global-mode t)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-P") 'projectile-invalidate-cache)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

(add-to-list 'projectile-globally-ignored-directories "elpa")
(add-to-list 'projectile-globally-ignored-directories ".cache")
(add-to-list 'projectile-globally-ignored-directories "node_modules")

(provide 'init-projectile)
