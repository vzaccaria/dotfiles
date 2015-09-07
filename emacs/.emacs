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
 '(flycheck-c/c++-gcc-executable
   "/Users/zaccaria/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-c++")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(frame-background-mode (quote dark))
 '(haskell-mode-hook
   (quote
	(turn-on-haskell-indent turn-on-haskell-indentation turn-on-haskell-unicode-input-method)))
 '(inferior-octave-program "/usr/local/bin/octave")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(markdown-command "pandoc -s")
 '(org-babel-js-cmd "/usr/local/Cellar/iojs/2.5.0/bin/iojs")
 '(org-confirm-babel-evaluate nil)
 '(safe-local-variable-values (quote ((flycheck-clang-language-standard "c++11")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#ffffea" :foreground "#93a1a1"))))
 '(org-block-begin-line ((t (:background "#eaeaff" :foreground "#008ed1" :slant italic))))
 '(org-code ((t (:background "#ffffea" :foreground "#93a1a1")))))





