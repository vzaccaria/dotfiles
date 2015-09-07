
(setq auto-save-default nil) 
(setq save-place-file (concat user-emacs-directory "saveplace.el") ) ; use standard emacs dir
(setq-default save-place t)

(set-terminal-coding-system 'utf-8-unix)

;; start maximized
(setq split-height-threshold 0)
(setq split-width-threshold 0)

;; scroll control
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)


