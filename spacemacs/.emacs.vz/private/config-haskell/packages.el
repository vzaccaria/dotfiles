(setq config-haskell-packages
      '(
        (config-haskell-flycheck :location local)
        haskell-mode
        ))



(defun config-haskell/init-config-haskell-flycheck ()
  (use-package config-haskell-flycheck
    :config
    (config-haskell/flycheck-config-haskell)
    )
  )

(defun config-haskell/post-init-haskell-mode ()
  (setq haskell-process-args-ghci
        '("-ferror-spans" "-fshow-loaded-modules"))

  (setq haskell-process-args-cabal-repl
        '("--ghc-options=-ferror-spans -fshow-loaded-modules"))

  (setq haskell-process-args-stack-ghci
        '("--ghci-options=-ferror-spans -fshow-loaded-modules"
          "--no-build" "--no-load"))

  (setq haskell-process-args-cabal-new-repl
        '("--ghc-options=-ferror-spans -fshow-loaded-modules"))
  )


(defun config-haskell/flycheck-config-haskell ()
  (when vz/is-linux (config/flycheck-config-haskell-use-haskell-stack-liquid))
  )
