(setq config-packages
      '(
        deft
        ;; Owner of
        (flycheck-misc :location local)
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
    (config/flycheck-config-javascript)
    (config/flycheck-config-shell)
    )
  )

(defun config/post-init-deft ()
  (setq deft-directory "~/Dropbox/org")
  (setq deft-recursive t)
  )
