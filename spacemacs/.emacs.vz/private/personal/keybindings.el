




;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)



(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cj" 'js-doc-insert-function-doc)

(global-set-key (kbd "<f1>")  'vz/open-inbox)
(global-set-key (kbd "<f2>")  'vz/open-today)
 
(global-set-key (kbd "<f4>")  'personal/show-agenda-all)
(global-set-key (kbd "<f5>")  'helm-mu)
(global-set-key (kbd "<f7>")  'vz/open-today)
(global-set-key (kbd "<f6>")  'vz/open-inbox)
(global-set-key (kbd "<f12>") 'helm-mu)

;; to make your life easier; dont add any other character after M-* (!!!)
(global-set-key (kbd "M-`") 'toggle-window-split)
(global-set-key (kbd "M-1") 'org-agenda-list)
(global-set-key (kbd "M-2") 'org-todo-list)

(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-e") 'personal/show-agenda-all)


(global-set-key (kbd "M-r") 'eval-region)
(global-set-key (kbd "M-t") 'beautify)
(global-set-key (kbd "M-u") 'helm-mini)
(global-set-key (kbd "M-i") 'fill-paragraph)
(global-set-key (kbd "M-o") 'vz/switch-dictionary)

(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-s") 'evil-write-all)
(global-set-key (kbd "M-d") 'mc/mark-next-like-this)
(global-set-key (kbd "M-f") 'helm-projectile-ag)
(global-set-key (kbd "M-g") 'deft)
(global-set-key (kbd "M-h") 'helm-m-x)
(global-set-key (kbd "M-j") 'vz/align-code-to-equals)
(global-set-key (kbd "M-l") 'helm-apropos)
(global-set-key (kbd "M-/") 'evil-search-forward)


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-c") 'pbcopy)
(global-set-key (kbd "M-v") 'pbpaste)
(global-set-key (kbd "M-B") 'vz/previous-error)
(global-set-key (kbd "M-b") 'vz/next-error)

(global-set-key (kbd "s-=") 'zoom-frm-in)
(global-set-key (kbd "s--") 'zoom-frm-out)

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)


;; ESS mode hooks

;; (define-key comint-mode-map [C-up] 'comint-previous-matching-input-from-input)
;; (define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

(provide 'index)
;;; index.el ends here
