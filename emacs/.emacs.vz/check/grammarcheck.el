(flycheck-define-checker grammar-gramcheck
  "A general purpose grammar checker. It uses LanguageTool."

    :command ("gramchk" "-a" "-x" source-original)
    :error-parser flycheck-parse-checkstyle
    :standard-input t
    :modes (markdown-mode latex-mode))

(add-to-list 'flycheck-checkers 'grammar-gramcheck)

;;;
