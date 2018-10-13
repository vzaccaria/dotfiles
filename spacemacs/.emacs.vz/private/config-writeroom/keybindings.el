(global-set-key (kbd "M-/") 'vz/latex-enable-writeroom)


(add-hook 'LaTeX-mode-hook (lambda ()
     (define-key LaTeX-mode-map (kbd "M-r") 'vz/latex-refresh-writeroom)
     ))


(provide 'keybindings)
;;; index.el ends here
