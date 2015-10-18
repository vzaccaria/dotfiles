;;; keymap.el --- Summary

;; Copyright (C) 2015  Vittorio Zaccaria <vittorio.zaccaria@gmail.com>

;; Author: Vittorio Zaccaria <vittorio.zaccaria@gmail.com>
;; Keywords: convenience

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

;;; These are my key bindings. Hopefully, they should be cross-patform.

;;; Code:


(load-file "~/.emacs.vz/keymap/index.el")
(load-file "~/.emacs.vz/keymap/evil.el")
(load-file "~/.emacs.vz/keymap/magit.el")



(define-key global-map (kbd "s-_") (lambda () (interactive)
                   (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)




;; to make your life easier; dont add any other character after M-* (!!!)
(global-set-key (kbd "M-b") 'recompile)
(global-set-key (kbd "M-r") 'eval-region)
(global-set-key (kbd "M-w") 'kill-this-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-h") 'helm-M-x)
(global-set-key (kbd "M-f") 'projectile-ag)
(global-set-key (kbd "M-e") 'yas-expand)
(global-set-key (kbd "M-j") 'desktop+-load)
(global-set-key (kbd "M-J") 'desktop+-create)



(global-set-key (kbd "M-`") 'toggle-window-split)

(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out)

(global-set-key (kbd "M-d") 'iedit-mode)

;;(global-set-key (kbd "<ESC>-<down>") 'previous-buffer)
;;(global-set-key (kbd "M-c a") 'org-agenda)



(add-hook 'emacs-lisp-mode-hook
      '(lambda ()
       (define-key emacs-lisp-mode-map (kbd "M-,") 'beautify-lisp)))


(add-hook 'markdown-mode-hook
      '(lambda ()
       (define-key markdown-mode-map (kbd "M-,") 'beautify-markdown)))

(add-hook 'c-mode-common-hook
      '(lambda ()
       (define-key c-mode-base-map (kbd "M-,") 'beautify-c)))

(add-hook 'js-mode-hook
      '(lambda ()
       (define-key js-mode-map (kbd "M-,") 'web-beautify-js)))


;; ESS mode hooks

(global-set-key [C-tab] 'other-window)

(define-key comint-mode-map [C-up] 'comint-previous-matching-input-from-input)
(define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

(provide 'index)
;;; index.el ends here
