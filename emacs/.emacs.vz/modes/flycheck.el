(use-package flycheck
	:commands global-flycheck-mode
	:init (global-flycheck-mode)
	:config (progn
	(setq flycheck-check-syntax-automatically '(save mode-enabled))
	(setq flycheck-standard-error-navigation nil)
	;; flycheck errors on a tooltip (doesnt work on console)
	(when (display-graphic-p (selected-frame))
	(eval-after-load 'flycheck
	'(custom-set-variables
	'(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
)))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)
