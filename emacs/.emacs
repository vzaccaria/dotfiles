(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
                package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
                package-archives)
(package-initialize)


;;              _                                   __  __  
;;   __ _ _   _| |_ ___  ___  __ ___   _____  ___  / _|/ _| 
;;  / _` | | | | __/ _ \/ __|/ _` \ \ / / _ \/ _ \| |_| |_  
;; | (_| | |_| | || (_) \__ \ (_| |\ V /  __/ (_) |  _|  _| 
;;  \__,_|\__,_|\__\___/|___/\__,_| \_/ \___|\___/|_| |_|   
                                                         
(setq auto-save-default nil) 

;;                           _ _             
;;   ___ _ __   ___ ___   __| (_)_ __   __ _ 
;;  / _ \ '_ \ / __/ _ \ / _` | | '_ \ / _` |
;; |  __/ | | | (_| (_) | (_| | | | | | (_| |
;;  \___|_| |_|\___\___/ \__,_|_|_| |_|\__, |
;;                                     |___/

(set-terminal-coding-system 'utf-8-unix)
(require 'whitespace)


;;  _____       _ _ 
;; | ____|_   _(_) |
;; |  _| \ \ / / | |
;; | |___ \ V /| | |
;; |_____| \_/ |_|_|
                 
(require 'evil)
(evil-mode 1)

;;   ____          _                  
;;  / ___|   _ ___| |_ ___  _ __ ___  
;; | |  | | | / __| __/ _ \| '_ ` _ \ 
;; | |__| |_| \__ \ || (_) | | | | | |
;;  \____\__,_|___/\__\___/|_| |_| |_|
                                   
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(haskell-mode-hook
   (quote
	(turn-on-haskell-indent turn-on-haskell-indentation turn-on-haskell-unicode-input-method)))
 '(inferior-octave-program "/usr/local/bin/octave")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(markdown-command "pandoc -s")
 '(safe-local-variable-values (quote ((flycheck-clang-language-standard "c++11")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace.el") ) ; use standard emacs dir
(setq-default save-place t)
(require 'iso-transl)

;;                                      _      
;;   ___  _ __ __ _ _ __ ___   ___   __| | ___ 
;;  / _ \| '__/ _` | '_ ` _ \ / _ \ / _` |/ _ \
;; | (_) | | | (_| | | | | | | (_) | (_| |  __/
;;  \___/|_|  \__, |_| |_| |_|\___/ \__,_|\___|
;;            |___/

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(set-face-attribute 'default nil
                :family "Hasklig" :height 140 :weight 'normal)

(setq org-agenda-files (list "~/Dropbox/org/work.org"
							 "~/Dropbox/org/thesis.org"
							 "~/development/github/screencap/teasy.org"
							 "~/development/stforge/HS_VHDL/STMicro.org"
							 "~/development/github/documents/books/infob-book/programma-dettagliato/InfoB.org"))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(define-key global-map (kbd "s-_") (lambda () (interactive) 
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

(defun gtd ()
     (interactive)
        (find-file "~/Dropbox/org/work.org")
	 )
(setq org-agenda-custom-commands
      '(("w" tags "READING|DEVELOPMENT" nil)               ;; (1)
        ;; ("d" tags "DEVELOP" nil)               ;; (2)
        ;; ("h" todo "PERSONAL-@ERRANDS" nil)         ;; (3)
        ;; ("p" tags "PROJECT-MAYBE-DONE" nil)        ;; (4)
        ;; ("m" tags "PROJECT&MAYBE" nil)
        ;; ("a" "My agenda"
        ;;  ((org-agenda-list)
        ;;   (tags-todo "URGENT")                     ;; (5)
        ;;   (tags "PROJECT-MAYBE-DONE")))            ;; (6)
        ;; ;; ... put your other custom commands here
       ))
                 
;;   ___  _     _   
;;  / __|| |_ _| |_ 
;; | (_|_   _|_   _|
;;  \___||_|   |_|  
                 
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(define-key c-mode-base-map (kbd "s-/") 'comment-region)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
(show-paren-mode t)


;;            _                  _       
;;  ___ _ __ (_)_ __  _ __   ___| |_ ___ 
;; / __| '_ \| | '_ \| '_ \ / _ \ __/ __|
;; \__ \ | | | | |_) | |_) |  __/ |_\__ \
;; |___/_| |_|_| .__/| .__/ \___|\__|___/
;;             |_|   |_|                 
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/root-directory "/Users/zaccaria/development/github/yasnippet-snippets")
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
;(ac-set-trigger-key "TAB")
;(ac-set-trigger-key "<tab>")

(require 'use-package)

;;   __ _            _               _    
;;  / _| |_   _  ___| |__   ___  ___| | __
;; | |_| | | | |/ __| '_ \ / _ \/ __| |/ /
;; |  _| | |_| | (__| | | |  __/ (__|   < 
;; |_| |_|\__, |\___|_| |_|\___|\___|_|\_\
;;        |___/                           


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

;;           _           _               
;; __      _(_)_ __   __| | _____      __
;; \ \ /\ / / | '_ \ / _` |/ _ \ \ /\ / /
;;  \ V  V /| | | | | (_| | (_) \ V  V / 
;;   \_/\_/ |_|_| |_|\__,_|\___/ \_/\_/  
                                      
;;      _                _             _       
;;  ___| |__   ___  _ __| |_ ___ _   _| |_ ___ 
;; / __| '_ \ / _ \| '__| __/ __| | | | __/ __|
;; \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
;; |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "s-w") 'evil-quit)
(global-set-key (kbd "s-h") 'helm-M-x)
(global-set-key (kbd "s-g") 'projectile-ag)
(global-set-key (kbd "s-/") 'comment-region)


;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(global-set-key (kbd "s-r") 'recompile)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

 ;; start maximized


(global-set-key (kbd "s-`") 'toggle-window-split)

(setq split-height-threshold 0)
(setq split-width-threshold 0)
(require 'zoom-frm)
(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out)

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

(global-set-key (kbd "s-d") 'mc/mark-next-like-this)

;;             _                  
;;   ___   ___| |_ __ ___   _____ 
;;  / _ \ / __| __/ _` \ \ / / _ \
;; | (_) | (__| || (_| |\ V /  __/
;;  \___/ \___|\__\__,_| \_/ \___|
                               

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))


;;; Octave mode needs executable path
(add-to-list 'exec-path "/usr/local/bin")

;;   __ _       _      _   
;;  / _(_) __ _| | ___| |_ 
;; | |_| |/ _` | |/ _ \ __|
;; |  _| | (_| | |  __/ |_ 
;; |_| |_|\__, |_|\___|\__|
;;        |___/            
(defun figlet-region (&optional b e)
  (interactive "r")
	(shell-command-on-region b e "toilet -d ~/.figlet -f 3d" (current-buffer) t)
	  (comment-region (mark) (point)))

(global-set-key (kbd "s-.") 'figlet-region)

;;    _                                _       _   
;;   (_) __ ___   ____ _ ___  ___ _ __(_)_ __ | |_ 
;;   | |/ _` \ \ / / _` / __|/ __| '__| | '_ \| __|
;;   | | (_| |\ V / (_| \__ \ (__| |  | | |_) | |_ 
;;  _/ |\__,_| \_/ \__,_|___/\___|_|  |_| .__/ \__|
;; |__/                                 |_|



;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-gjslint)))

(setq flycheck-disabled-checkers '(javascript-jshint))
(setq flycheck-eslintrc nil)

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))




(flycheck-define-checker javascript-flow
  "A JavaScript syntax and style checker using Flow.

See URL `http://flowtype.org/'."
  :command ("flow" source-original)
  :error-patterns
  ((error line-start
	  (file-name)
	  ":"
	  line
	  ":"
	  (minimal-match (one-or-more not-newline))
	  ": "
	  (message (minimal-match (and (one-or-more anything) "\n")))
	  line-end))
  :modes js-mode)

(flycheck-add-next-checker 'javascript-eslint 'javascript-flow)


;;    _           _      
;;   (_) __ _  __| | ___ 
;;   | |/ _` |/ _` |/ _ \
;;   | | (_| | (_| |  __/
;;  _/ |\__,_|\__,_|\___|
;; |__/                  

(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))


;;  _                      _   _  __ _           _   _             
;; | |__   ___  __ _ _   _| |_(_)/ _(_) ___ __ _| |_(_) ___  _ __  
;; | '_ \ / _ \/ _` | | | | __| | |_| |/ __/ _` | __| |/ _ \| '_ \ 
;; | |_) |  __/ (_| | |_| | |_| |  _| | (_| (_| | |_| | (_) | | | |
;; |_.__/ \___|\__,_|\__,_|\__|_|_| |_|\___\__,_|\__|_|\___/|_| |_|

(defun beautify-c ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))


(defun beautify-markdown (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
		"pandoc --read markdown --write markdown-simple_tables+pipe_tables-fenced_code_blocks-fenced_code_attributes" (current-buffer) t))


(defun beautify-org (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
		"pandoc --columns=120 --read org --write org" (current-buffer) t))


(add-hook 'org-mode-hook
 '(lambda ()
    (define-key org-mode-map (kbd "s-,") 'beautify-org)))


(add-hook 'markdown-mode-hook
 '(lambda ()
    (define-key markdown-mode-map (kbd "s-,") 'beautify-markdown)))

(add-hook 'c-mode-common-hook
 '(lambda ()
    (define-key c-mode-base-map (kbd "s-,") 'beautify-c)))

(add-hook 'js-mode-hook
 '(lambda ()
    (define-key js-mode-map (kbd "s-,") 'web-beautify-js)))

;;         __ _            
;;   __ _ / _| |_ ___ _ __ 
;;  / _` | |_| __/ _ \ '__|
;; | (_| |  _| ||  __/ |   
;;  \__,_|_|  \__\___|_|



;;  _               _        _ _ 
;; | |__   __ _ ___| | _____| | |
;; | '_ \ / _` / __| |/ / _ \ | |
;; | | | | (_| \__ \   <  __/ | |
;; |_| |_|\__,_|___/_|\_\___|_|_|


(require 'haskell-snippets)
(eval-after-load 'flycheck '(require 'flycheck-ghcmod))

;;  _          _           
;; | |__   ___| |_ __ ___  
;; | '_ \ / _ \ | '_ ` _ \ 
;; | | | |  __/ | | | | | |
;; |_| |_|\___|_|_| |_| |_|

(require 'projectile)
(projectile-global-mode)

;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

;;      _ _              _ 
;;   __| (_)_ __ ___  __| |
;;  / _` | | '__/ _ \/ _` |
;; | (_| | | | |  __/ (_| |
;;  \__,_|_|_|  \___|\__,_|

(require 'dired)

(add-hook 'dired-mode-hook
          (lambda ()
			(dired-omit-mode 1)
			(setq dired-omit-files
				  (concat dired-omit-files "\\|.o$"))
            ))

;;;(after 'projectile
;;;  (package 'helm-projectile))


;;; (defun helm-my-buffers ()
;;;   (interactive)
;;;   (let ((helm-ff-transformer-show-only-basename nil))
;;;   (helm-other-buffer '(helm-c-source-buffers-list
;;;                        helm-c-source-elscreen
;;;                        helm-c-source-projectile-files-list
;;;                        helm-c-source-ctags
;;;                        helm-c-source-recentf
;;;                        helm-c-source-locate)
;;;                      "*helm-my-buffers*")))


;;; .emacs 
