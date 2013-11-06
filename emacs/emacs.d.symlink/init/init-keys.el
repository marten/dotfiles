;; Font size
(define-key global-map (kbd "s-=") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)

;; Navigation
(define-key global-map (kbd "<home>") 'move-beginning-of-line)
(define-key global-map (kbd "<end>") 'end-of-line)

(provide 'init-keys)
