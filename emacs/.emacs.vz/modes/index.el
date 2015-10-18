(require 'whitespace)
(require 'saveplace)
(require 'use-package)
(require 'zoom-frm)
(require 'iedit)
(require 'evil-iedit-state)
(require 'projectile)
(require 'paren)
(require 'json-mode)
(require 'tern)
(require 'rainbow-delimiters)
(require 'visual-regexp-steroids)
(require 'magit)
(require 'osx-pseudo-daemon)
(require 'sx)
(require 'ess-mode)
(require 'desktop) ;; session management
(require 'desktop+) ;; session management
(require 'bs) ;; buffer management
(require 'evil-leader)
(require 'saveplace)

(projectile-global-mode)

;; load helpers
(load-file "~/.emacs.vz/modes/helpers.el")


;; core
(load-file "~/.emacs.vz/modes/org.el")
(load-file "~/.emacs.vz/modes/evil.el")
(load-file "~/.emacs.vz/modes/yasnippet.el")
(load-file "~/.emacs.vz/modes/autocomplete.el")
(load-file "~/.emacs.vz/modes/flycheck.el")
(load-file "~/.emacs.vz/modes/helm.el")
(load-file "~/.emacs.vz/modes/dired.el")

;; languages
(load-file "~/.emacs.vz/modes/octave.el")
(load-file "~/.emacs.vz/modes/cc.el")
(load-file "~/.emacs.vz/modes/javascript.el")
(load-file "~/.emacs.vz/modes/jade.el")
(load-file "~/.emacs.vz/modes/haskell.el")
(load-file "~/.emacs.vz/modes/fip.el")
(load-file "~/.emacs.vz/modes/ess.el")
(load-file "~/.emacs.vz/modes/protobuf.el")

;; other minors
;; Highlight TODO and FIXME in comments
(package-require 'fic-ext-mode)

(add-something-to-mode-hooks '(c++ tcl emacs-lisp python text markdown latex) 'fic-ext-mode)

;; For licenses (M-x legalese)
;; To set license (C-u M-x legalese)

(package-require 'legalese)
(package-require 'helm-dash)
