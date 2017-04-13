;;; packages.el --- personal layer packages file for Spacemacs.


(defconst hemacs-packages
  '(
    haskell-emacs
    ))

;;; for writing extensions in haskell
(defun hemacs/init-haskell-emacs ()
  (use-package haskell-emacs
    :init
    (progn
      (setq haskell-emacs-dir "~/.emacs.vz/private/haskell-emacs/")
      (setq haskell-emacs-build-tool 'stack)
      (haskell-emacs-init))
    )
  )

