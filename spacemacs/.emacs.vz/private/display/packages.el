
(setq display-packages
      '(
        (pretty-fonts :location local)
        (pretty-code :location local)
        (pretty-magit :location local)
        writeroom-mode
        ))

(defun display/init-writeroom-mode ()
  (use-package writeroom-mode
    :commands (writeroom-mode)
    :init
    (evil-leader/set-key "Tw" 'writeroom-mode)
    :config
    (setq writeroom-restore-window-config t)
    (setq writeroom-width 100)
    ))

(defun display/init-pretty-fonts ()
  (use-package pretty-fonts
    :config
    (progn
      (when (display-graphic-p)
      (pretty-fonts-set-kwds
       '(;; Fira Code Ligatures
         (pretty-fonts-fira-font prog-mode-hook org-mode-hook)
         ;; Custom replacements not possible with `pretty-code' package
         ))

      (pretty-fonts-set-fontsets
       '(("fontawesome"
          ;;                                          
          #xf07c #xf0c9 #xf0c4 #xf0cb #xf017 #xf101 #xf024 #xf085 #xf040)

         ("all-the-icons"
          ;;    
          #xe907 #xe928)

         ("github-octicons"
          ;;                          
          #xf091 #xf059 #xf076 #xf075 #xe192  #xf016)

         ("material icons"
          ;;        
          #xe871 #xe918 #xe3e7
          ;;
          #xe3d0 #xe3d1 #xe3d2 #xe3d4)

         ("Symbola"
          ;; 𝕊    ⨂      ∅      ⟻    ⟼     ⊙      𝕋       𝔽
          #x1d54a #x2a02 #x2205 #x27fb #x27fc #x2299 #x1d54b #x1d53d
          ;; 𝔹    𝔇       𝔗
          #x1d539 #x1d507 #x1d517)))))))


(defun display/init-pretty-magit ()
  (use-package pretty-magit
    :config
    (progn
      (when (display-graphic-p)
      (pretty-magit "feat" ? (:foreground "slate gray" :height 1.2))
      (pretty-magit "minor" ? (:foreground "slate gray" :height 1.2))
      (pretty-magit "update"  ? (:foreground "#375E97" :height 1.2))
      (pretty-magit "fix"     ? (:foreground "#FB6542" :height 1.2))
      (pretty-magit "master"  ?⊙ (:box t :height 1.2) t)
      (pretty-magit "origin"  ?  (:box t :height 1.2) t)))))



(defun display/init-pretty-code ()
  (use-package pretty-code
    :config
    (progn
      (global-prettify-symbols-mode 1)

      (add-hook 'haskell-mode-hook (lambda ()
                                     (when (display-graphic-p)
                                       (pretty-code-set-hasklig-ligatures)
                                       )
                                     ))
      (add-hook 'LaTeX-mode-hook (lambda ()
                                   (pretty-code-init-latex-mode-prettification)
                                   ))
      (add-hook 'plain-TeX-mode-hook (lambda ()
                                       (pretty-code-init-latex-mode-prettification)
                                       ))
      )
    ))
