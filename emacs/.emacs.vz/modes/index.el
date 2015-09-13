(require 'whitespace)
(require 'saveplace)
(require 'use-package)
(require 'zoom-frm)
(require 'iedit)
(require 'evil-iedit-state)
(require 'projectile)
(require 'paren)
(projectile-global-mode)


;; core
(load-file "~/.emacs.vz/modes/org.el")
(load-file "~/.emacs.vz/modes/evil.el")
;; (load-file "~/.emacs.vz/modes/autopair.el")
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

;; languages: `protobuf'
(require 'protobuf-mode)
(eval-after-load 'flycheck
  '(require 'flycheck-protobuf))
(add-to-list 'flycheck-checkers 'protobuf-protoc-reporter t)
