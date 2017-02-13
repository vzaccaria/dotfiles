(package-require 'sage-shell-mode)
(package-require 'auto-complete-sage)

(add-hook 'sage-shell:sage-mode-hook 'ac-sage-setup)
(add-hook 'sage-shell-mode-hook 'ac-sage-setup)

(package-require 'wolfram-mode)
(autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
(setq wolfram-program "/Applications/Mathematica.app/Contents/MacOS/MathKernel")
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))
