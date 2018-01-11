(require 'flycheck)

(defun config/flycheck-config-latex-linux ()
  (flycheck-define-checker grammar-gramcheck
    "A general purpose grammar checker. It uses LanguageTool."
    :command ("gramchk" "check" source-original)
    :error-parser flycheck-parse-checkstyle
    :standard-input nil
    :modes (latex-mode plain-TeX-mode))
  (add-to-list 'flycheck-checkers 'grammar-gramcheck)
  (add-hook 'plain-TeX-mode-hook 'flycheck-mode)
  (add-hook 'LaTeX-mode-hook 'flycheck-mode)
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
                             (flycheck-select-checker 'javascript-eslint)
                             ))

  (add-hook 'js2-mode-hook '(lambda ()
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


(defgroup flycheck-liquid nil
  " LiquidHaskell type popup tooltip."
  :group 'flycheck-options
  :prefix "flycheck-liquid-")

(defcustom flycheck-liquid-use-stack t  ;use stack by default
  "Set popup style."
  :type 'boolean
  :group 'flycheck-liquid)

(defmacro make-liquid-checker (name command)
  (let ((default-reporter
          `((message
             (one-or-more " ") (one-or-more not-newline)
             (zero-or-more "\n"
                           (one-or-more " ")
                           (zero-or-more not-newline)))
            line-end)))

    `(flycheck-define-checker ,name
       "A Haskell refinement type checker using liquidhaskell.

See URL 'https://github.com/ucsd-progsys/liquidhaskell'."
       :command ,command

       :error-patterns
       ((error line-start " " (file-name) ":" line ":" column ":"
               ,@default-reporter)
        (error line-start " " (file-name) ":" line ":" column "-" (one-or-more digit) ":"
               ,@default-reporter)
        (error line-start " " (file-name) ":(" line "," column ")-(" (one-or-more digit) "," (one-or-more digit) "):"
               ,@default-reporter)
        )
       :error-filter
       (lambda (errors)
         (-> errors
             flycheck-dedent-error-messages
             flycheck-sanitize-errors))
       :modes (haskell-mode literate-haskell-mode)
       :next-checkers ((warnings-only . haskell-hlint)))
    ))

(make-liquid-checker haskell-liquid ("liquid" source-inplace))
(make-liquid-checker haskell-stack-liquid ("stack" "exec" "--" "liquid" source-inplace))

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

(provide 'flycheck-misc)
