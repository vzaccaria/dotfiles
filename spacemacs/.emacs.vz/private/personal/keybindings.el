




;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)



(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cj" 'js-doc-insert-function-doc)

(global-set-key (kbd "<f1>")  'vz/open-inbox)
(global-set-key (kbd "<f2>")  'vz/open-today)
 
(global-set-key (kbd "<f10>") 'vz/open-today)
(global-set-key (kbd "<f11>") 'vz/open-inbox)
(global-set-key (kbd "<f12>") 'mu4e-headers-search)

(global-set-key (kbd "<f4>")  'personal/show-agenda-all)
(global-set-key (kbd "<f5>")  'mu4e-headers-search)
(global-set-key (kbd "<f7>")  'vz/open-today)
(global-set-key (kbd "<f6>")  'vz/open-inbox)


(global-set-key (kbd "<f16>")  'personal/show-agenda-all)
(global-set-key (kbd "<f17>")  'mu4e-headers-search)
(global-set-key (kbd "<f18>")  'vz/open-today)
(global-set-key (kbd "<f19>")  'vz/open-inbox)

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
(global-set-key (kbd "M-l") 'vz/go-to-interpreter)
(global-set-key (kbd "M-/") 'evil-search-forward)


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-c") 'pbcopy)
(global-set-key (kbd "M-v") 'pbpaste)
(global-set-key (kbd "M-B") 'vz/previous-error)
(global-set-key (kbd "M-b") 'vz/next-error)
(global-set-key (kbd "M-n") 'evil-window-vnew)

(global-set-key (kbd "s-=") 'zoom-frm-in)
(global-set-key (kbd "s--") 'zoom-frm-out)

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)

;; Use 'cat -vte' on the command line to see which keys are received by emacs

;; ^[   maps to \e
;; ^[[A maps to <up>

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

(provide 'index)
;;; index.el ends here
