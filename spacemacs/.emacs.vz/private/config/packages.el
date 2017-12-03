(setq config-packages
      '(
        ;; Core
        flycheck

        ;; Owner of
        (flycheck-liquidhs :location local)
        ))

(defun config/post-init-flycheck ()
  (config/flycheck-config-latex)
  (config/flycheck-config-markdown)
  (config/flycheck-config-verilog)
  (config/flycheck-config-javascript)
  (config/flycheck-config-shell)
  (config/flycheck-config-haskell)
  )


(defun config/flycheck-config-latex ()
  (flycheck-define-checker grammar-gramcheck
    "A general purpose grammar checker. It uses LanguageTool."

    :command ("gramchk" "--configfile" "/Users/zaccaria/.gramchk.yml" "check" source-original)
    :error-parser flycheck-parse-checkstyle
    :standard-input nil
    :modes (latex-mode plain-TeX-mode))
  (add-to-list 'flycheck-checkers 'grammar-gramcheck)
  (add-hook 'plain-TeX-mode-hook 'flycheck-mode)
  (add-hook 'LaTeX-mode-hook 'flycheck-mode)
  )

(defun config/flycheck-config-markdown ()
  (flycheck-define-checker grammar-gramcheck-markdown
    "A general purpose grammar checker. "

    :command ("gramchk" "--configfile" "/Users/zaccaria/.gramchk.yml" "check" source-original)
    :error-parser flycheck-parse-checkstyle
    :standard-input nil
    :modes (markdown-mode))
  (add-to-list 'flycheck-checkers 'grammar-gramcheck-markdown)
  (add-hook 'markdown-mode-hook 'flycheck-mode)
  )

(defun config/flycheck-config-verilog ()
  (flycheck-define-checker verilog-check
    "A linter for verilog using verilator."
    :command ("/usr/local/bin/perl" "/usr/local/bin/verilator" "--lint-only" "-Wall" source)
    :error-patterns
    ((warning line-start "%Warning-" (zero-or-more not-newline) ": "
              (file-name) ":" line ": " (message) line-end)
     (error line-start "%Error: " (file-name) ":"
            line ": " (message) line-end))
    :modes verilog-mode)
  (add-to-list 'flycheck-checkers 'verilog-check)
  (add-hook 'verilog-mode-hook (lambda () (interactive)
                            (flycheck-mode)
                            (flycheck-disable-checker 'verilog-verilator)
                            (flycheck-select-checker 'verilog-check)))
  )

(defun config/flycheck-config-javascript ()
  (add-hook 'js-mode-hook '(lambda ()
                                    (flycheck-mode)
                                     (flycheck-select-checker 'javascript-eslint)
                                     ))
  )

(defun config/flycheck-config-shell ()
   (add-hook 'shell-mode-hook  (lambda ()
                          (interactive)
                          (flycheck-select-checker 'sh-shellcheck)
                          )
  )
   )

(defun config/flycheck-config-haskell-use-haskell-liquid ()
  (interactive)
  (add-to-list 'flycheck-checkers 'haskell-liquid)
  (add-hook 'haskell-mode-hook (lambda () (flycheck-select-checker 'haskell-liquid)))
  )

(defun config/flycheck-config-haskell-use-haskell-stack-liquid ()
  (interactive)
  (add-to-list 'flycheck-checkers 'haskell-stack-liquid)
  (add-hook 'haskell-mode-hook (lambda () (flycheck-select-checker 'haskell-stack-liquid)))
  )

(defun config/flycheck-config-haskell ()
  (when (is-linuxp) (config/flycheck-config-haskell-use-haskell-liquid))
  )

(defun config/init-flycheck-liquidhs ()
  (use-package flycheck-liquidhs)
  )
