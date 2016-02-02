;;; xyz

(package-require 'haskell-mode)
(package-require 'ac-haskell-process) ; if not installed via package.el

(add-hook 'interactive-haskell-mode-hook 'ac-haskell-process-setup)
(add-hook 'haskell-interactive-mode-hook 'ac-haskell-process-setup)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'haskell-interactive-mode))

(setq haskell-program-name "stack ghci")

(use-package flycheck-haskell
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'flycheck-mode-hook 'flycheck-haskell-configure))
