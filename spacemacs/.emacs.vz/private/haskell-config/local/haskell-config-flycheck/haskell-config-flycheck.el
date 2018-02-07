(require 'flycheck)

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

(defun haskell-config/flycheck-config-haskell-use-haskell-liquid ()
  (interactive)
  (add-to-list 'flycheck-checkers 'haskell-liquid)
  (add-hook 'haskell-mode-hook (lambda () (flycheck-select-checker 'haskell-liquid)))
  )

(defun haskell-config/flycheck-config-haskell-use-haskell-stack-liquid ()
  (interactive)
  (add-to-list 'flycheck-checkers 'haskell-stack-liquid)
  (add-hook 'haskell-mode-hook (lambda () (flycheck-select-checker 'haskell-stack-liquid)))
  )

(provide 'haskell-config-flycheck)
