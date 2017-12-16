
(setq display-packages
      '(
        (pretty-code :location local)
        ))


(defun display/init-pretty-code ()
  (use-package pretty-code
    :config
    (progn
      (global-prettify-symbols-mode 1)

      (add-hook 'haskell-mode-hook (lambda ()
                                     (when (display-graphic-p)
                                       (pretty-code-set-hasklig-ligatures)
                                       )
                                     ))
      (add-hook 'LaTeX-mode-hook (lambda ()
                                   (pretty-code-init-latex-mode-prettification)
                                   ))
      (add-hook 'plain-TeX-mode-hook (lambda ()
                                       (pretty-code-init-latex-mode-prettification)
                                       ))
      )
    ))
