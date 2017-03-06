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
(global-set-key (kbd "M-D") 'vz/switch-dictionary)
(global-set-key (kbd "M-f") 'helm-projectile-ag)
(global-set-key (kbd "M-g") 'deft)
(global-set-key (kbd "M-h") 'helm-apropos)
(global-set-key (kbd "M-j") 'vz/align-code-to-equals)
(global-set-key (kbd "M-k") 'vz/recompile)
(global-set-key (kbd "M-l") 'org-latex-export-to-latex)
(global-set-key (kbd "M-/") 'evil-search-forward)


(global-set-key (kbd "M-z") 'helm-keyboard-quit)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-c") 'pbcopy)
(global-set-key (kbd "M-v") 'pbpaste)
(global-set-key (kbd "M-B") 'spacemacs/previous-error)
(global-set-key (kbd "M-b") 'spacemacs/next-error)
(global-set-key (kbd "M-n") 'evil-window-vnew)
(global-set-key (kbd "M-N") 'evil-window-new)
(global-set-key (kbd "M-.") 'helm-resume)

(global-set-key (kbd "s-=") 'zoom-frm-in)
(global-set-key (kbd "s--") 'zoom-frm-out)

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)


;; Evil normal mode overrides
(define-key evil-normal-state-map (kbd "M-.") 'helm-resume)
(define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer)
(define-key evil-visual-state-map (kbd "M-a") 'mark-whole-buffer)

;; Function key revival
(define-key org-mode-map (kbd "<f1>")  'org-beamer-export-to-pdf)
(define-key org-mode-map (kbd "<f2>")  'org-latex-export-to-pdf)
(define-key org-mode-map (kbd "<f3>")  'org-latex-export-to-latex)
(define-key org-mode-map (kbd "<f5>")  'vz/switch-dictionary)


;; Orgmode utilities
(define-key org-mode-map (kbd "s-b")  'spacemacs/org-bold)
(define-key org-mode-map (kbd "s-k")  'spacemacs/org-verbose)
(define-key org-mode-map (kbd "s-i")  'spacemacs/org-italic)
(define-key org-mode-map (kbd "s-u")  'spacemacs/org-underline)

(cond

 ;; -- OSX TERMINAL KEYBINDINGS
 ((eq system-type 'darwin)
  (setq vz--layers (append vz--layers vz--darwin-layers))
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


  ;;  Shift + Arrows
  (global-set-key [(shift-up)] 'evil-backward-paragraph)    ;; 46
  (global-set-key [(shift-down)] 'evil-forward-paragraph)  ;; 47
  (global-set-key [(shift-right)] 'evil-forward-word-end) ;; 48
  (global-set-key [(shift-left)] 'evil-backward-word-end)  ;; 48

  ;;  Shift + Meta + Arrows
  (global-set-key (kbd "\e [1;10A") 'evil-window-up)
  (global-set-key (kbd "\e [1;10B") 'evil-window-down)
  (global-set-key (kbd "\e [1;10C") 'evil-window-right)
  (global-set-key (kbd "\e [1;10D") 'evil-window-left)

  ;;  Meta + Arrows
  (global-set-key (kbd "\e <up>")    'evil-window-up)
  (global-set-key (kbd "\e <down>")  'evil-window-down)
  (global-set-key (kbd "\e <right>") 'evil-window-right)
  (global-set-key (kbd "\e <left>")  'evil-window-left)

  ;; for osx gui                     S + Arrows
  (global-set-key (kbd "s-<up>")    'evil-window-up)
  (global-set-key (kbd "s-<down>")  'evil-window-down)
  (global-set-key (kbd "s-<right>") 'evil-window-right)
  (global-set-key (kbd "s-<left>")  'evil-window-left))

 ((eq system-type 'gnu/linux)
  (global-set-key (kbd "M-<up>")    'evil-window-up)
  (global-set-key (kbd "M-<down>")  'evil-window-down)
  (global-set-key (kbd "M-<right>") 'evil-window-right)
  (global-set-key (kbd "M-<left>")  'evil-window-left))

 )








(provide 'index)
;;; index.el ends here
