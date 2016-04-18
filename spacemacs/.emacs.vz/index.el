;;; index.el --- Summary

;;; begin by setting paths in the case this is called in daemon mode.
(setenv "PATH" (format "%s:%s" "/usr/local/bin" (getenv "PATH")))
(setenv "PATH" (format "%s:%s" "/usr/local/texlive/2013/bin/universal-darwin" (getenv "PATH")))
(setenv "PATH" (format "%s:%s" "/Applications/Mathematica.app/Contents/MacOS" (getenv "PATH")))
(setenv "PATH" (format "%s:%s" "/Users/zaccaria/.local/bin" (getenv "PATH")))

(setenv "NODE_PATH" (format "%s:%s" "/usr/local/lib/node_modules" (getenv "NODE_PATH")))

;;; This positioned here should make the mouse work in terminal!

;;(load-file "~/.emacs.vz/packageinit.el")
;;(load-file "~/.emacs.vz/modes/index.el")
;;(load-file "~/.emacs.vz/set.el")
(load-file "~/.emacs.vz/functions.el")
;;(load-file "~/.emacs.vz/keymap/index.el")
;;(load-file "~/.emacs.vz/themes/index.el")
;;(load-file "~/.emacs.vz/spell.el")
;;(load-file "~/.emacs.vz/macros.el")
;;(load-file "~/.emacs.vz/tabs.el")
;;(load-file "~/.emacs.vz/check/grammarcheck.el")
(load-file "~/.emacs.vz/agenda.el")
;;; index.el ends here
