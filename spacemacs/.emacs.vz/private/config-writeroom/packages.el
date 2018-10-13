
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
    (setq writeroom-restore-window-config t)
    (setq writeroom-width 100)
    (set-default 'preview-scale-function 2)
    ))

