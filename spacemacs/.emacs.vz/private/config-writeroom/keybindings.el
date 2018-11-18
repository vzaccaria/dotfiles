(global-set-key (kbd "M-/") 'vz/writeroom-mode-enable)

(add-hook 'reftex-toc-mode-hook (lambda ()
    (define-key reftex-toc-mode-map (kbd "M-o") 'vz/latex-toggle-toc)
))

(add-hook 'LaTeX-mode-hook (lambda ()
     (define-key LaTeX-mode-map (kbd "M-r") 'vz/writeroom-latex-preview-refresh)
     (define-key LaTeX-mode-map (kbd "M-o") 'vz/latex-toggle-toc)
     ))


(provide 'keybindings)
;;; index.el ends here
