(require 'org)

(load-file "~/.emacs.vz/modes/ox-latex.el")
(load-file "~/.emacs.vz/modes/org-babel.el")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-src-preserve-indentation t)
