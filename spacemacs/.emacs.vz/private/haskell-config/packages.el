(setq haskell-config-packages
      '(
        (haskell-config-flycheck :location local)
        ))



(defun haskell-config/init-haskell-config-flycheck ()
  (use-package haskell-config-flycheck
    :config
    (haskell-config/flycheck-config-haskell)
    )
  )




(defun haskell-config/flycheck-config-haskell ()
  (when vz/is-linux (config/flycheck-config-haskell-use-haskell-stack-liquid))
  )
