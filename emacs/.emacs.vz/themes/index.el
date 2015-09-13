(load-file "~/.emacs.vz/themes/solarized.el")
(load-file "~/.emacs.vz/themes/lang-org.el")

;; Main font
(set-face-attribute 'default nil
                :family "Hasklig" :height 140 :weight 'normal)

;; Parenthesis highlight

(set-face-background 'show-paren-match "#586e75")
(set-face-foreground 'show-paren-match "#073642")
(set-face-attribute 'show-paren-match nil :weight 'bold)

;;
