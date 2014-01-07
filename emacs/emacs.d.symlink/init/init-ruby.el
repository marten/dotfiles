; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for Ruby files" t)
; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
;(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
;(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
;(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
;(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

;(add-hook 'enh-ruby-mode-hook '(lambda ()
;                                 (local-set-key (kbd "RET") 'newline-and-indent)))


(sp-pair "{" nil :actions :rem)
(sp-local-pair '(ruby-mode enh-ruby-mode) "{" nil :actions :rem)
(sp-local-pair '(ruby-mode enh-ruby-mode) "{" "}"
               :actions '(insert autoskip)
               :unless '(sp-ruby-in-string-or-word-p)
               :pre-handlers '(sp-ruby-pre-handler)
               :post-handlers '(sp-ruby-post-handler)
               )

(sp-local-pair '(ruby-mode enh-ruby-mode) "|" nil :actions :rem)
(sp-local-pair '(ruby-mode enh-ruby-mode) "|" "|"
               :actions '(insert autoskip)
               :unless '(sp-ruby-in-string-or-word-p)
               :pre-handlers '(sp-ruby-pre-handler)
               :post-handlers '(sp-ruby-post-handler)
               :suffix "")

(provide 'init-ruby)
