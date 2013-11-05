(require 'projectile)

(require 'grizzl)

(projectile-global-mode t)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

(provide 'init-projectile)
