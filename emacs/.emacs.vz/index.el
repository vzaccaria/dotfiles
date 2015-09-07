(require 'package)

(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)

(package-initialize)

(load-file "~/.emacs.vz/modes/index.el")
(load-file "~/.emacs.vz/set.el")
(load-file "~/.emacs.vz/agenda.el")
(load-file "~/.emacs.vz/functions.el")
(load-file "~/.emacs.vz/keymap.el")
(load-file "~/.emacs.vz/themes/index.el")
