;;; index.el --- Summary

;; Copyright (C) 2015  Vittorio Zaccaria <vittorio.zaccaria@gmail.com>

;; Author: Vittorio Zaccaria <vittorio.zaccaria@gmail.com>
;; Keywords:

;; Permission is hereby granted, free of charge, to any person obtaining a
;; copy of this software and associated documentation files (the "Software"),
;; to deal in the Software without restriction, including without limitation
;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;; and/or sell copies of the Software, and to permit persons to whom the
;; Software is furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; Except as contained in this notice, the name(s) of the above copyright
;; holders shall not be used in advertising or otherwise to promote the sale,
;; use or other dealings in this Software without prior written authorization.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;; DEALINGS IN THE SOFTWARE.

;;; Commentary:

;;; Code:



(package-require 'whitespace)
(package-require 'saveplace)
(package-require 'use-package)
(package-require 'zoom-frm)
(package-require 'iedit)
(package-require 'evil-iedit-state)
(package-require 'projectile)
(package-require 'paren)
(package-require 'json-mode)
(package-require 'rainbow-delimiters)
(package-require 'visual-regexp-steroids)
(package-require 'magit)
(package-require 'osx-pseudo-daemon)
(package-require 'sx)
(package-require 'ess-mode)
(package-require 'desktop) ;; session management
(package-require 'bs) ;; buffer management
(package-require 'evil-leader)
(package-require 'saveplace)
(package-require 'pomodoro)
(package-require 'xclip)

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
(load-file "~/.emacs.vz/modes/auc-latex.el")
(load-file "~/.emacs.vz/modes/sage.el")

;; Clipboard
(xclip-mode 1)

;; other minors
;; Highlight TODO and FIXME in comments
(package-require 'fic-ext-mode)

(add-something-to-mode-hooks '(c++ tcl emacs-lisp python text markdown latex) 'fic-ext-mode)

;; For licenses (M-x legalese)
;; To set license (C-u M-x legalese)

(package-require 'legalese)
(package-require 'helm-dash)


;; pomodoro!
(pomodoro-add-to-mode-line)

(provide 'index)
;;; index.el ends here
