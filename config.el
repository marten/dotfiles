;;;  -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Input Mono Narrow" :size 12)
      doom-big-font (font-spec :family "Input Mono Narrow" :size 25))

(map! (:after ruby-mode
        :map ruby-mode-map
        :n "C-c C-c" #'seeing-is-believing))
