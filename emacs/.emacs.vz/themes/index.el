(load-theme 'solarized-light t)
(load-file "~/.emacs.vz/themes/lang-org.el")


;; Highlight current line
(hl-line-mode 1)
(global-hl-line-mode 1)

;; Main font
;; (set-face-attribute 'default nil
;;                 :family "Hasklig" :height 140 :weight 'normal)

;; Parenthesis highlight

(set-face-background 'show-paren-match "#586e75")
(set-face-foreground 'show-paren-match "#073642")
(set-face-attribute 'show-paren-match nil :weight 'bold)

;; Black on almost white.. better projecting!
(defun vz/load-infob-theme ()
  (interactive)
  (load-theme 'leuven t)
  )

;;
