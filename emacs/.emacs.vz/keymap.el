;; key bindings


(define-key global-map "\C-c l" 'org-store-link)
(define-key global-map (kbd "s-_") (lambda () (interactive)
                   (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key magit-mode-map (kbd "<tab>") 'magit-section-toggle)

;; Only when in Magit status!
(define-key magit-mode-map (kbd "M-c") 'magit-commit)
(define-key magit-mode-map (kbd "M-f") 'magit-commit-instant-fixup)
(define-key magit-mode-map (kbd "M-a") 'magit-commit-amend)

;; The following are needed by `evil' mode.
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(define-key evil-normal-state-map (kbd "M-.") (lambda ()
                        (interactive)
                        (evil-next-buffer)))
(define-key evil-normal-state-map (kbd "M-,") (lambda ()
                        (interactive)
                        (evil-prev-buffer)))
;; end `evil'


;; to make your life easier; dont add any other character after M-* (!!!)
(global-set-key (kbd "M-b") 'recompile)
(global-set-key (kbd "M-r") 'eval-region)
(global-set-key (kbd "M-w") 'kill-this-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-f") 'projectile-ag)
(global-set-key (kbd "M-e") 'yas-expand)
(global-set-key (kbd "M-j") 'desktop+-load)
(global-set-key (kbd "M-J") 'desktop+-create)



(global-set-key (kbd "M-i") 'magit-status)
(global-set-key (kbd "M-l") 'magit-log-all)

(global-set-key (kbd "M-`") 'toggle-window-split)

(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out)

(global-set-key (kbd "M-d") 'iedit-mode)

;;(global-set-key (kbd "<ESC>-<down>") 'previous-buffer)
;;(global-set-key (kbd "M-c a") 'org-agenda)



(add-hook 'emacs-lisp-mode-hook
      '(lambda ()
       (define-key emacs-lisp-mode-map (kbd "M-,") 'beautify-lisp)))


(add-hook 'markdown-mode-hook
      '(lambda ()
       (define-key markdown-mode-map (kbd "M-,") 'beautify-markdown)))

(add-hook 'c-mode-common-hook
      '(lambda ()
       (define-key c-mode-base-map (kbd "M-,") 'beautify-c)))

(add-hook 'js-mode-hook
      '(lambda ()
       (define-key js-mode-map (kbd "M-,") 'web-beautify-js)))

;; Orgmode shortcuts

(add-hook 'org-mode-hook
      '(lambda ()
       (define-key org-mode-map (kbd "M-,") 'beautify-org)))

(add-hook 'org-mode-hook
      '(lambda ()
       (define-key org-mode-map (kbd "M-.") 'org-beamer-export-to-pdf)))

(add-hook 'org-mode-hook
      '(lambda ()
       (define-key org-mode-map (kbd "M->") 'org-latex-export-to-pdf)))


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
