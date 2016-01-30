(package-require 'dired)

(add-hook 'dired-mode-hook
          (lambda ()
			(dired-omit-mode 1)
			(setq dired-omit-files
				  (concat dired-omit-files "\\|.o$\\|.hi$"))
            ))
