;;; org.el --- Summary

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

;;; Org-mode global

;; Orgmode shortcuts

(evil-declare-key 'normal org-mode-map
  "t" 'org-todo
  "'e" 'yas-expand-from-trigger-key
  "'b" 'org-beamer-export-to-pdf
  "'l" 'org-latex-export-to-pdf
  "'g" 'org-open-at-point
  (kbd "TAB") 'org-cycle
  "-" 'org-ctrl-c-minus ; change bullet style
  "<" 'org-metaleft ; out-dent
  ">" 'org-metaright ; indent
  )

(define-key global-map "\C-cm"
  (lambda () (interactive) (org-capture nil "m")))

(define-key global-map "\C-cl"
  (lambda () (interactive) (org-capture nil "l")))

(define-key global-map "\C-ci"
  (lambda () (interactive) (org-capture nil "i")))

(define-key global-map "\C-cd"
  (lambda () (interactive) (org-capture nil "d")))

(define-key global-map "\C-co"
  (lambda () (interactive) (org-capture nil "o")))

(define-key global-map "\C-ct"
  (lambda () (interactive) (org-capture nil "t")))

(provide 'org)
;;; org.el ends here
