(setq config-haskell-packages
      '(
        ;; (hc-flycheck :location local)
        ;; (hc-hare :location local)
        haskell-mode
        ))



;; (defun config-haskell/init-hc-flycheck ()
;;   (use-package hc-flycheck
;;     :config
;;     (config-haskell/flycheck-config-haskell)
;;     )
;;   )

 ;; Hare does not seem to work..

;; (defun config-haskell/init-hc-hare ()
;;   (use-package hc-hare)
;;   )

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


;; (defun config-haskell/flycheck-config-haskell ()
;;   (when vz/is-linux (hc-flycheck/flycheck-config-haskell-use-haskell-stack-liquid))
;;   )
