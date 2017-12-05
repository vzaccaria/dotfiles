
(setq display-packages
      '(
        (pretty-code :location local)
        (pretty-eshell :location local)
        ))


(defun display/init-pretty-code ()
  (use-package pretty-code
    :config
    (progn
      (global-prettify-symbols-mode 1)
      (pretty-code-set-hasklig-ligatures)
      )
    ))

(defun display/init-pretty-eshell ()
  (use-package pretty-eshell
    :config
    (progn
      (esh-section esh-dir
                   "\xf07c"  ; 
                   (abbreviate-file-name (eshell/pwd))
                   '(:foreground "gold" :bold ultra-bold :underline t))
      (esh-section esh-git
                   "\xe907"  ; 
                   (magit-get-current-branch)
                   '(:foreground "pink"))
      (esh-section esh-python
                   "\xe928"  ; 
                   pyvenv-virtual-env-name)
      (esh-section esh-clock
                   "\xf017"  ; 
                   (format-time-string "%H:%M" (current-time))
                   '(:foreground "forest green"))
      (esh-section esh-num
                   "\xf0c9"  ; 
                   (number-to-string esh-prompt-num)
                   '(:foreground "brown"))
      (setq eshell-funcs (list esh-dir esh-git esh-python esh-clock esh-num)))))
