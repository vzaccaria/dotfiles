;;; index.el --- Summary

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


(load-file "~/.emacs.vz/keymap/evil.el")
(load-file "~/.emacs.vz/keymap/magit.el")
(load-file "~/.emacs.vz/keymap/org.el")
(load-file "~/.emacs.vz/keymap/haskell.el")



(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)



(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; to make your life easier; dont add any other character after M-* (!!!)
(global-set-key (kbd "M-`") 'toggle-window-split)
(global-set-key (kbd "M-1") 'org-agenda-list)
(global-set-key (kbd "M-2") 'org-todo-list)

(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-w") 'kill-this-buffer)
(global-set-key (kbd "M-e") 'yas-expand)
(global-set-key (kbd "M-r") 'eval-region)
(global-set-key (kbd "M-t") 'beautify)
(global-set-key (kbd "M-u") 'bs-show)
(global-set-key (kbd "M-i") 'magit-status)
(global-set-key (kbd "M-o") 'term-fix-mouse)

(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-s") 'evil-write-all)
(global-set-key (kbd "M-d") 'iedit-mode)
(global-set-key (kbd "M-f") 'helm-projectile-ag)
(global-set-key (kbd "M-g") 'helm-org-agenda-files-headings)
(global-set-key (kbd "M-h") 'helm-m-x)
(global-set-key (kbd "M-j") 'vz/align-code-to-equals)
(global-set-key (kbd "M-l") 'helm-apropos)
(global-set-key (kbd "M-/") 'evil-search-forward)


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-c") 'pbcopy)
(global-set-key (kbd "M-v") 'pbpaste)
(global-set-key (kbd "M-b") 'recompile)
(global-set-key (kbd "M-n") 'switch-to-next-buffer)
(global-set-key (kbd "M-m") 'switch-to-prev-buffer)

(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out)



;; ESS mode hooks

(global-set-key [C-tab] 'other-window)

(define-key comint-mode-map [C-up] 'comint-previous-matching-input-from-input)
(define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

(provide 'index)
;;; index.el ends here
