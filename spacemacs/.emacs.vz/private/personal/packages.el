;;; packages.el --- personal layer packages file for Spacemacs.


;; define a org package here
(defconst personal-packages
  '(org
    org-bullets
    ox
    ox-md
    ox-gfm
    ))


;; define initialization here
(defun personal/post-init-org ()

  (setq org-agenda-custom-commands '(("w" "My Agenda"
                                      ((agenda "")
                                       (todo "TODAY")
                                       (todo "")))))

  (setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM") 
  (setq org-agenda-todo-list-sublevels nil)
  (setq org-agenda-files
        (list "~/Dropbox/org"
              "~/Dropbox/org/howtos"
              "~/Dropbox/org/research"
              "~/Dropbox/org/other"
              "/Users/zaccaria/development/github/documents/curriculum/cv2013/curriculum.org"
              "/Users/zaccaria/Dropbox/Commuting/Altro/Personal/Chiara/Casa/Viale Varese/Casa.org"
              "~/development/github/materiale-corsi/documents/lectures/infob/programma-dettagliato/InfoBProg.org"
              "~/development/github/materiale-corsi/documents/lectures/infob/materiale/InfoBMat.org"))

  (setq org-todo-keywords
        '((sequence "TODO" "TODAY" "|" "DONE" "CANCELLED")
          (sequence "TOREIMBURSE" "|" "REIMBURSED"  )))

  ;; Using orgmode as a presentation
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t)
  (setq org-level-color-stars-only t )
  (setq org-confirm-babel-evaluate nil)

  (add-hook 'org-mode-hook (lambda () 
                             (define-key org-mode-map "\M-e" 'personal/show-agenda-all)))


  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (emacs-lisp . t)
     (sh . t)
     (haskell . t)
     (js . t)
     (C . t)
     (ditaa . t)
     ))

  (setq org-babel-js-cmd "/usr/local/bin/babel-node --presets es2015,stage-2")
  )

(defun personal/post-init-org-bullets ()
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(defun personal/show-agenda-all ()
  ;; Show agenda and todo list
  (interactive)
  (org-agenda nil "w"))


(defun personal/init-ox-latex ()

  (use-package ox-latex
    :config
    (progn


      ;;; remove from the article class the default packages
      (add-to-list 'org-latex-classes
                   '("article"
                     "\\documentclass\{article\}
                [NO-DEFAULT-PACKAGES]"
                     ("\\section\{%s\}" . "\\section*\{%s\}")
                     ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                     ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

      ;;; same for beamer
      (add-to-list 'org-latex-classes
                   '("beamer"
                     "\\documentclass\[presentation\]\{beamer\}
                [NO-DEFAULT-PACKAGES]"
                     ("\\section\{%s\}" . "\\section*\{%s\}")
                     ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                     ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))


      (setq org-latex-minted-options
            '(("obeytabs" "true") ("baselinestretch" "0.95")))

      (setq org-latex-listings 'minted)

      (setq org-latex-pdf-process
            '("/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

      )))
