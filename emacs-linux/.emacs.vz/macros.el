(package-require 'elmacro)

(defun spell-it (args)
  (interactive "P")
  (flyspell-mode 1)
   (ispell-change-dictionary "it" nil)
   (flyspell-buffer)
   )

(defun spell-en (args)
   (interactive "P")
  (flyspell-mode 1)
   (ispell-change-dictionary "en" nil)
   (flyspell-buffer)
   )