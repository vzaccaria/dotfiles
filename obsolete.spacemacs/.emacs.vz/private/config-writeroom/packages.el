
(setq config-writeroom-packages
      '(
        writeroom-mode
        ))

(defun config-writeroom/init-writeroom-mode ()
  (use-package writeroom-mode
    :commands (writeroom-mode)
    :init
    (evil-leader/set-key "Tw" 'writeroom-mode)
    :config
    (with-eval-after-load 'writeroom-mode
      (progn (vz/writeroom-mode-on-enter))
    ))
)
