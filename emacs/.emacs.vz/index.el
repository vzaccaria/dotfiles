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
;;;
;;; Main entry point, after init.el

;;; Code:


;;; begin by setting paths in the case this is called in daemon mode.
(setenv "PATH" (format "%s:%s" "/usr/local/bin" (getenv "PATH")))
(setenv "PATH" (format "%s:%s" "/usr/local/texlive/2013/bin/universal-darwin" (getenv "PATH")))
(setenv "PATH" (format "%s:%s" "/Applications/Mathematica.app/Contents/MacOS" (getenv "PATH")))
(setenv "PATH" (format "%s:%s" "/Users/zaccaria/.local/bin" (getenv "PATH")))

(setenv "NODE_PATH" (format "%s:%s" "/usr/local/lib/node_modules" (getenv "NODE_PATH")))

;;; This positioned here should make the mouse work in terminal!

(load-file "~/.emacs.vz/packageinit.el")
(load-file "~/.emacs.vz/modes/index.el")
(load-file "~/.emacs.vz/set.el")
(load-file "~/.emacs.vz/functions.el")
(load-file "~/.emacs.vz/keymap/index.el")
(load-file "~/.emacs.vz/themes/index.el")
(load-file "~/.emacs.vz/agenda.el")
(load-file "~/.emacs.vz/spell.el")
(load-file "~/.emacs.vz/macros.el")
(load-file "~/.emacs.vz/tabs.el")
(load-file "~/.emacs.vz/check/grammarcheck.el")
(provide 'index)
;;; index.el ends here
