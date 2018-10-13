
(defun vz/latex-refresh-writeroom ()
  (interactive)
    (TeX-fold-buffer)
    (preview-cache-preamble-off)
    (preview-buffer)
    )

(defun vz/latex-on-save-refresh-writeroom ()
  (add-hook 'before-save-hook 'vz/latex-refresh-writeroom)
  )


(defun vz/latex-enable-writeroom ()
  (interactive)
  (writeroom-mode t)
  (vz/latex-refresh-writeroom)
  )


(provide 'functions)
;;; functions.el ends here
