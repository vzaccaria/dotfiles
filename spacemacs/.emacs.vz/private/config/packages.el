(setq config-packages
      '(
        ;; Core
        flycheck

        ;; Owner of
        (flycheck-misc :location local)
        ))

(setq is-darwin (eq system-type 'darwin))
(setq is-linuxp (eq system-type 'gnu/linux))


(defun config/post-init-flycheck ()
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


(defun config/flycheck-config-haskell ()
  (when is-linuxp (config/flycheck-config-haskell-use-haskell-liquid))
  )
