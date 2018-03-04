(setq haskell-config-packages
      '(
        (haskell-config-flycheck :location local)
        haskell-mode
        ))



(defun haskell-config/init-haskell-config-flycheck ()
  (use-package haskell-config-flycheck
    :config
    (haskell-config/flycheck-config-haskell)
    )
  )

(defun haskell-config/post-init-haskell-mode ()
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


(defun haskell-config/flycheck-config-haskell ()
  (when vz/is-linux (config/flycheck-config-haskell-use-haskell-stack-liquid))
  )
