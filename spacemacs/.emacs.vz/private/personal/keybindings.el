




;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)



(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cj" 'js-doc-insert-function-doc)

;; to make your life easier; dont add any other character after M-* (!!!)
(global-set-key (kbd "M-`") 'toggle-window-split)
(global-set-key (kbd "M-1") 'org-agenda-list)
(global-set-key (kbd "M-2") 'org-todo-list)

(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-w") 'kill-this-buffer)
(global-set-key (kbd "M-e") 'personal/show-agenda-all)


(global-set-key (kbd "M-r") 'eval-region)
(global-set-key (kbd "M-t") 'beautify)
(global-set-key (kbd "M-u") 'bs-show)
(global-set-key (kbd "M-i") 'magit-status)   
(global-set-key (kbd "M-o") 'term-fix-mouse)

(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-s") 'evil-write-all)
(global-set-key (kbd "M-d") 'mc/mark-next-like-this)
(global-set-key (kbd "M-f") 'helm-projectile-ag)
(global-set-key (kbd "M-g") 'helm-org-agenda-files-headings)
(global-set-key (kbd "M-h") 'helm-m-x)
(global-set-key (kbd "M-j") 'vz/align-code-to-equals)
(global-set-key (kbd "M-l") 'helm-apropos)
(global-set-key (kbd "M-/") 'evil-search-forward)


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-c") 'pbcopy)
(global-set-key (kbd "M-v") 'pbpaste)
(global-set-key (kbd "M-b") 'recompile)
(global-set-key (kbd "M-n") 'switch-to-next-buffer)
(global-set-key (kbd "M-m") 'switch-to-prev-buffer)

(global-set-key (kbd "s-=") 'zoom-in)
(global-set-key (kbd "s--") 'zoom-out) 


;; ESS mode hooks

;; (define-key comint-mode-map [C-up] 'comint-previous-matching-input-from-input)
;; (define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

(provide 'index)
;;; index.el ends here
