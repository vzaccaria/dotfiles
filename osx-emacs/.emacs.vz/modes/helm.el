(require 'helm)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)


(setq helm-apropos-fuzzy-match t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
