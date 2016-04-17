(defun add-something-to-mode-hooks (mode-list something)
  "helper function to add a callback to multiple hooks"
  (dolist (mode mode-list)
	(add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))

(defun save-current-kbd-macro-to-dot-emacs (name)
  "Save the current macro as named function definition inside
your initialization file so you can reuse it anytime in the
future."
  (interactive "SSave Macro as: ")
  (name-last-kbd-macro name)
  (save-excursion
	(find-file-literally "~/.emacs.vz/macros.el")
	(goto-char (point-max))
	(insert "\n\n;; Saved macro\n")
	(insert-kbd-macro name)
	(insert "\n")))
