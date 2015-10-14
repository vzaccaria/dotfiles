(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map (kbd "s-_") (lambda () (interactive)
                                     (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key magit-mode-map (kbd "<tab>") 'magit-section-toggle)

;; Only when in Magit status!
(define-key magit-mode-map (kbd "s-c") 'magit-commit)
(define-key magit-mode-map (kbd "s-f") 'magit-commit-instant-fixup)
(define-key magit-mode-map (kbd "s-a") 'magit-commit-amend)

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
(global-set-key (kbd "s-r") 'eval-region)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-h") 'helm-M-x)
(global-set-key (kbd "s-f") 'projectile-ag)
(global-set-key (kbd "s-/") 'comment-region)
(global-set-key (kbd "s-e") 'yas-expand)
(global-set-key (kbd "s-j") 'desktop+-load)
(global-set-key (kbd "s-J") 'desktop+-create)



(global-set-key (kbd "s-i") 'magit-status)
(global-set-key (kbd "s-l") 'magit-log-all)

(global-set-key (kbd "s-`") 'toggle-window-split)

(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out)

(global-set-key (kbd "s-d") 'iedit-mode)
;; (global-set-key (kbd "s-.") 'figlet-region)

(global-set-key (kbd "s-<up>") 'next-buffer)
(global-set-key (kbd "s-<down>") 'previous-buffer)



(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (define-key emacs-lisp-mode-map (kbd "s-,") 'beautify-lisp)))


(add-hook 'markdown-mode-hook
          '(lambda ()
             (define-key markdown-mode-map (kbd "s-,") 'beautify-markdown)))

(add-hook 'c-mode-common-hook
          '(lambda ()
             (define-key c-mode-base-map (kbd "s-,") 'beautify-c)))

(add-hook 'js-mode-hook
          '(lambda ()
             (define-key js-mode-map (kbd "s-,") 'web-beautify-js)))

;; Orgmode shortcuts

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "s-,") 'beautify-org)))

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "s-.") 'org-beamer-export-to-pdf)))

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "s->") 'org-latex-export-to-pdf)))


(define-key global-map "\C-cm"
  (lambda () (interactive) (org-capture nil "m")))

(define-key global-map "\C-cl"
  (lambda () (interactive) (org-capture nil "l")))

(define-key global-map "\C-ci"
  (lambda () (interactive) (org-capture nil "i")))

(define-key global-map "\C-cd"
  (lambda () (interactive) (org-capture nil "d")))

(define-key global-map "\C-co"
  (lambda () (interactive) (org-capture nil "o")))

(define-key global-map "\C-ct"
  (lambda () (interactive) (org-capture nil "t")))

;; ESS mode hooks

(global-set-key [C-tab] 'other-window)

(define-key comint-mode-map [C-up] 'comint-previous-matching-input-from-input)
(define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

(global-set-key (kbd "C-x C-b") 'bs-show)
