(load-file "~/.emacs.vz/index.el")


;;   ____          _
;;  / ___|   _ ___| |_ ___  _ __ ___
;; | |  | | | / __| __/ _ \| '_ ` _ \
;; | |__| |_| \__ \ || (_) | | | | | |
;;  \____\__,_|___/\__\___/|_| |_| |_|

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(desktop-save-mode nil)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(frame-background-mode (quote dark))
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indent turn-on-haskell-indentation turn-on-haskell-unicode-input-method)))
 '(inferior-octave-program "/usr/local/bin/octave")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(latex-inputenc-coding-alist
   (quote
    (("ansinew" . windows-1252)
     ("applemac" . mac-roman)
     ("ascii" . us-ascii)
     ("cp1250" . windows-1250)
     ("cp1252" . windows-1252)
     ("cp1257" . cp1257)
     ("cp437de" . cp437)
     ("cp437" . cp437)
     ("cp850" . cp850)
     ("cp852" . cp852)
     ("cp858" . cp858)
     ("cp865" . cp865)
     ("latin1" . iso-8859-1)
     ("latin2" . iso-8859-2)
     ("latin3" . iso-8859-3)
     ("latin4" . iso-8859-4)
     ("latin5" . iso-8859-5)
     ("latin9" . iso-8859-15)
     ("next" . next)
     ("utf8")
     ("utf8x"))))
 '(markdown-command "pandoc -s")
 '(org-babel-js-cmd "/usr/local/Cellar/iojs/2.5.0/bin/iojs")
 '(org-confirm-babel-evaluate nil)
 '(org-ioslide-hlevel 2)
 '(safe-local-variable-values
   (quote
    ((flycheck-disabled-checkers quote
                                 (c/c++-clang))
     (flycheck-clang-language-standard "c++11")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#ffffea" :foreground "#93a1a1"))))
 '(org-block-begin-line ((t (:background "#eaeaff" :foreground "#008ed1" :slant italic))))
 '(org-code ((t (:background "#ffffea" :foreground "#93a1a1")))))
