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

;; (defun config/flycheck-config-orgmode ()
;;   (flycheck-define-checker grammar-gramcheck-orgmode
;;     "A general purpose grammar checker. "

;;     :command ("gramchk" "--configfile" "/Users/zaccaria/.gramchk.yml" "check" source-original)
;;     :error-parser flycheck-parse-checkstyle
;;     :standard-input nil
;;     :modes (org-mode))
;;   (add-to-list 'flycheck-checkers 'grammar-gramcheck-orgmode)
;;   (add-hook 'org-mode-hook 'flycheck-mode)
;;   )

(defun config/flycheck-config-assembler()
  (flycheck-define-checker mips32-asm-checker
    "A MIPS checker based on spim. "

    :command ("vz-spim" "check" source-original)
    :error-parser flycheck-parse-checkstyle
    :standard-input nil
    :modes (asm-mode))
  (add-to-list 'flycheck-checkers 'mips32-asm-checker)
  (add-hook 'asm-mode-hook 'flycheck-mode)
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


(defun config/flycheck-config-shell ()
  (add-hook 'shell-mode-hook  (lambda ()
                                (interactive)
                                (flycheck-select-checker 'sh-shellcheck)
                                )
            )
  )



(provide 'flycheck-misc)
