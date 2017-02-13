;; check
(setq auto-save-default nil)

;; check
(setq save-place-file (concat user-emacs-directory "saveplace.el") )
(setq-default save-place t)

;;; Gotta do UTF-8
;;; From: https://github.com/rmm5t/dotfiles/blob/master/emacs.d/personal/utf-8.el

(package-require 'un-define "un-define" t)
(set-buffer-file-coding-system 'utf-8 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)


;; Make sure all backup files only live in one place
;; Keep clutter to a minimum
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Open new window vertically
(setq split-height-threshold nil)
(setq split-width-threshold 80)

;; scroll control
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

;; Gotta see matching parens
(show-paren-mode t)

;; Trailing whitespace is unnecessary
(defvar whitespace-cleanup-on-save t)

;; (setq whitespace-cleanup-on-save nil)
(add-hook 'before-save-hook
		  (lambda ()
			(if whitespace-cleanup-on-save (whitespace-cleanup))))

;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

; use allout minor mode to have outlining everywhere.
(allout-mode)

; Add proper word wrapping
(global-visual-line-mode t)

; remember last position in files
(setq-default save-place t)
