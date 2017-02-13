;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-gjslint)))

(setq flycheck-disabled-checkers '(javascript-jshint))
(setq flycheck-eslintrc nil)


;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

(flycheck-define-checker javascript-flow
  "A JavaScript syntax and style checker using Flow.

See URL `http://flowtype.org/'."
  :command ("flow" source-original)
  :error-patterns
  ((error line-start
    (file-name)
    ":"
    line
    ":"
    (minimal-match (one-or-more not-newline))
    ": "
    (message (minimal-match (and (one-or-more anything) "\n")))
    line-end))
  :modes js-mode)

(flycheck-add-next-checker 'javascript-eslint 'javascript-flow)



(add-hook 'js-mode-hook (lambda () (tern-mode f)))

;; Web-mode enabled for jsx files only

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
