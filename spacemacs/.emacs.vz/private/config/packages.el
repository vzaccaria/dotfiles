(setq config-packages
      '(
        deft
        ;; Owner of
        (flycheck-misc :location local)
        linum-mode
        ))



(defun config/init-flycheck-misc ()
  (use-package flycheck-misc
    :config
    (if vz/is-darwin
        (config/flycheck-config-latex)
      (config/flycheck-config-latex-linux)
      )
    (config/flycheck-config-markdown)
    (config/flycheck-config-verilog)
    (config/flycheck-config-shell)
    (config/flycheck-config-orgmode)
    )
  )

(defun config/post-init-deft ()
  (setq deft-directory "~/Dropbox/org")
  (setq deft-recursive t)
  )

(defun config/post-init-linum-mode ()
  (linum-mode)
  (linum-relative-toggle)
  )

