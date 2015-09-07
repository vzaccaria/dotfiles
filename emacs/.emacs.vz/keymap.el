

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map (kbd "s-_") (lambda () (interactive) 
    (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(define-key c-mode-base-map (kbd "s-/") 'comment-region)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;; The following are needed by `evil' mode.
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(global-set-key [escape] 'evil-exit-emacs-state)
;; end `evil'

(global-set-key (kbd "s-b") 'recompile)
(global-set-key (kbd "s-r") 'recompile)
(global-set-key (kbd "s-w") 'evil-quit)
(global-set-key (kbd "s-h") 'helm-M-x)
(global-set-key (kbd "s-g") 'projectile-ag)
(global-set-key (kbd "s-/") 'comment-region)
(global-set-key (kbd "s-e") 'yas-expand)

(global-set-key (kbd "s-`") 'toggle-window-split)

(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out)

(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-.") 'figlet-region)


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

