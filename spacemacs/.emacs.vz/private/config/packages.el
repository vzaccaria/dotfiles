(setq config-packages
      '(
        deft
        ;; Owner of
        (flycheck-misc :location local)
        ))

(setq is-darwin (eq system-type 'darwin))
(setq is-linuxp (eq system-type 'gnu/linux))


(defun config/init-flycheck-misc ()
  (use-package flycheck-misc
    :config
    (config/flycheck-config-latex)
    (config/flycheck-config-markdown)
    (config/flycheck-config-verilog)
    (config/flycheck-config-javascript)
    (config/flycheck-config-shell)
    (config/flycheck-config-haskell)
    )
  )

(defun config/post-init-deft ()
  (setq deft-directory "~/Dropbox/org")
  (setq deft-recursive t)
  )


(defun config/flycheck-config-haskell ()
  (when is-linuxp (config/flycheck-config-haskell-use-haskell-liquid))
  )
