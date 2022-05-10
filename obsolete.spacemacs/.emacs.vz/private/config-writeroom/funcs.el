
(defun vz/writeroom-latex-preview-refresh ()
  (interactive)
    (set-default 'preview-scale-function 1.8)
    (TeX-fold-buffer)
    (preview-cache-preamble-off)
    (preview-buffer)
    )

(defun vz/latex-toggle-toc ()
  "Toggle TOC"
  (interactive)
  ;; use a property “state”. Value is t or nil
  (if (get 'vz-latex-toggle-toc 'state)
      (progn
        (reftex-toc-quit)
        (put 'vz-latex-toggle-toc 'state nil))
    (progn
      (reftex-toc)
      (put 'vz-latex-toggle-toc 'state t))))


(defun vz/writeroom-mode-on-enter ()
  (setq writeroom-extra-line-spacing 12)
  (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
  (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width)
  )

(defun vz/writeroom-mode-enable ()
  (interactive)
  (writeroom-mode t)
  (spacemacs/toggle-line-numbers-off)
  )

(defun vz/writeroom-mode-prepare ()
  (interactive)
  (load-theme 'whiteboard)
  (set-face-background 'hl-line "#dddddd")
  )


(provide 'functions)
;;; functions.el ends here
