
(Utils.init "personal/keybindings")




;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)



(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cj" 'js-doc-insert-function-doc)

 
(global-set-key (kbd "<f4>")  'personal/show-agenda-all)

(global-set-key (kbd "<f16>")  'personal/show-agenda-all)

;; to make your life easier; dont add any other character after M-* (!!!)
(global-set-key (kbd "M-`") 'toggle-window-split)
(global-set-key (kbd "M-1") 'helm-resume)
(global-set-key (kbd "M-2") 'org-todo-list)

(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-e") 'personal/show-agenda-all)


(global-set-key (kbd "M-r") 'eval-region)
(global-set-key (kbd "M-t") 'beautify)
(global-set-key (kbd "M-u") 'helm-mini)
(global-set-key (kbd "M-i") 'fill-paragraph)

;; org has problems with M-o
(global-set-key (kbd "M-o") 'vz/switch-dictionary)

(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-s") 'evil-write-all)
(global-set-key (kbd "M-d") 'vz/switch-dictionary)
(global-set-key (kbd "M-f") 'helm-projectile-ag)
(global-set-key (kbd "M-g") 'deft)
(global-set-key (kbd "M-h") 'helm-m-x)
(global-set-key (kbd "M-j") 'vz/align-code-to-equals)
(global-set-key (kbd "M-k") 'vz/recompile)
(global-set-key (kbd "M-l") 'org-latex-export-to-latex)
(global-set-key (kbd "M-/") 'evil-search-forward)


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-c") 'pbcopy)
(global-set-key (kbd "M-v") 'pbpaste)
(global-set-key (kbd "M-B") 'vz/previous-error)
(global-set-key (kbd "M-b") 'vz/next-error)
(global-set-key (kbd "M-n") 'evil-window-vnew)
(global-set-key (kbd "M-.") 'helm-resume)

(global-set-key (kbd "s-=") 'zoom-frm-in)
(global-set-key (kbd "s--") 'zoom-frm-out)

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)


;; The following are heavily based on my iTerm2 mappings. Use at your own risk!
;; Use 'cat -vte' on the command line to see which keys are received by emacs

;; ^[   maps to \e
;; ^[[A maps to <up>

;; Here we are defining some low-level translation of keys coming from iTerm.
;; We are then remapping the new "keys" to appropriate functions 
(define-key key-translation-map "\e\e[E" [(shift-up)])
(define-key key-translation-map "\e\e[F" [(shift-down)]) 
(define-key key-translation-map "\e\e[H" [(shift-right)])
(define-key key-translation-map "\e\e[I" [(shift-left)])


;;                    Shift + Arrows
(global-set-key [(shift-up)] 'evil-backward-paragraph)    ;; 46
(global-set-key [(shift-down)] 'evil-forward-paragraph)  ;; 47
(global-set-key [(shift-right)] 'evil-forward-word-end) ;; 48
(global-set-key [(shift-left)] 'evil-backward-word-end)  ;; 48

;;                    Shift + Meta + Arrows
(global-set-key (kbd "\e [1;10A") 'evil-window-up)
(global-set-key (kbd "\e [1;10B") 'evil-window-down)
(global-set-key (kbd "\e [1;10C") 'evil-window-right)
(global-set-key (kbd "\e [1;10D") 'evil-window-left)

;;                     Meta + Arrows
(global-set-key (kbd "\e <up>")    'evil-window-up)
(global-set-key (kbd "\e <down>")  'evil-window-down)
(global-set-key (kbd "\e <right>") 'evil-window-right)
(global-set-key (kbd "\e <left>")  'evil-window-left)

;; ESS mode hooks

(define-key c-mode-map [M-a] 'mark-whole-buffer)
;; (define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

;; Evil normal mode overrides
(define-key evil-normal-state-map (kbd "M-.") 'helm-resume)
(define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer)

;; Function key revival
(define-key org-mode-map (kbd "<f1>")  'org-beamer-export-to-pdf)
(define-key org-mode-map (kbd "<f2>")  'org-latex-export-to-pdf)
(define-key org-mode-map (kbd "<f3>")  'org-latex-export-to-latex)
(define-key org-mode-map (kbd "<f4>")  'vz/org-to-docx)

(define-key org-mode-map (kbd "∫")  'vz/org-current-word-bold)
(define-key org-mode-map (kbd "ç")  'vz/org-current-word-code)


;; (define-key markdown-mode-map (kbd "∫")  'markdown-insert-bold)
;; (define-key markdown-mode-map (kbd "ç")  'markdown-insert-code)

(Utils.end "personal/keybindings")
(provide 'index)
;;; index.el ends here
