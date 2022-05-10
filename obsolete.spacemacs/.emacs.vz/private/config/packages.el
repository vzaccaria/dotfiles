(setq config-packages
      '(
        deft
        zetteldeft
        ;; Owner of
        (flycheck-misc :location local)
        linum-mode
        ))



(defun config/init-flycheck-misc ()
  (use-package flycheck-misc
    :config
    (if vz/is-darwin
        (config/flycheck-config-latex)
      (config/flycheck-config-latex-linux)
      )
    (config/flycheck-config-markdown)
    (config/flycheck-config-verilog)
    (config/flycheck-config-shell)
    (config/flycheck-config-assembler)
    )
  )

(defun config/init-zetteldeft ()
  (use-package zetteldeft :after deft))

(defun config/post-init-deft ()
  (setq deft-directory "~/development/github/org-institutional/vz-personal-store/braindump")
  (setq deft-recursive t)
  (setq deft-extensions '("org" "md" "txt"))
  )

(defun config/post-init-linum-mode ()
  (linum-mode)
  (linum-relative-toggle)
  )

