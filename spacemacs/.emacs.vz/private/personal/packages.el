;;; packages.el --- personal layer packages file for Spacemacs.


(defconst personal-packages
  '(
    ox-latex
    org
    org-bullets
    ox
    ox-md
    ox-gfm
    spell-checking
    flycheck
    prodigy
    docker
    gnu-apl-mode
    haskell
    ))

(defun personal/init-docker ()
  (use-package docker
    :defer t
   ))

(defun personal/init-gnu-apl-mode ()
  (use-package gnu-apl-mode
    :defer t
    ))

(defun personal/post-init-spell-checking ()
  (setq-default ispell-program-name "/usr/local/bin/aspell")
  )

(defun personal/post-init-ox-latex ()
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
  )

;; define initialization here
(defun personal/post-init-org ()

  (setq org-agenda-custom-commands '(("w" "My Agenda"
                                      ((agenda "")
                                       (todo "TODAY")
                                       (todo "CHECK")
                                       (todo "")))))

  (setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM") 
  (setq org-agenda-todo-list-sublevels nil)
  (setq org-agenda-files
        (list "~/Dropbox/org"
              "~/Dropbox/org/howtos"
              "~/Dropbox/org/research"
              "~/Dropbox/org/other"
              "/Users/zaccaria/Dropbox/Commuting/Altro/Personal/Chiara/Casa/Viale Varese/Casa.org"
              "~/development/github/materiale-corsi/documents/lectures/infob/programma-dettagliato/InfoBProg.org"
              "~/development/github/materiale-corsi/documents/lectures/infob/materiale/InfoBMat.org"))

  (setq org-todo-keywords
        '((sequence "TODO" "TODAY" "CHECK" "|" "DONE" "CANCELLED")
          (sequence "TOREIMBURSE" "|" "REIMBURSED"  )))

  ;; Using orgmode as a presentation
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t)
  (setq org-level-color-stars-only t )
  (setq org-confirm-babel-evaluate nil)

  (add-hook 'org-mode-hook (lambda () 
                             (define-key org-mode-map "\M-e" 'personal/show-agenda-all)))

  (define-key global-map "\C-ct"
    (lambda () (interactive) (org-capture nil "t")))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (emacs-lisp . t)
     (sh . t)
     (haskell . t)
     (js . t)
     (C . t)
     (ditaa . t)
     (plantuml . t)
     ))

  (setq org-babel-js-cmd "/usr/local/bin/babel-node --presets es2015,stage-2")
  (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8039/plantuml.8039.jar")
  (setq org-capture-templates
        '(
          ("m" "Send mail to" entry
           (file+headline "~/Dropbox/org/work.org" "Ricordarsi di ...")
           "* TODO Send mail to  %?\n  %i\n")

          ("t" "Work todo generico" entry
           (file+headline "~/Dropbox/org/work.org" "Ricordarsi di ...")
           "* TODO %?\n  %i\n")

          ("d" "Feedback/note per il corso" entry
           (file+headline "/Users/zaccaria/development/github/documents/lectures/infob/materiale/InfoBMat.org" "Feedback e note prese durante il corso")
           "*  %?\n")

          )
        )


  )

(defun personal/post-init-org-bullets ()
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(defun personal/show-agenda-all ()
  ;; Show agenda and todo list
  (interactive)
  (org-agenda nil "w"))



(defun personal/post-init-prodigy ()
  (prodigy-define-service
    :name "After The Deadline"
    :env '(("LANG" "en_US.UTF-8")
           ("LC_CTYPE" "en_US.UTF-8"))

    :command "java"
    :args '("-Dfile.encoding=UTF-8" "-XX:+AggressiveHeap" "-XX:+UseParallelGC" "-Datd.lowmem=true" "-Dbind.interface=127.0.0.1" "-Dserver.port=1049" "-Dsleep.classpath=$ATD_HOME/lib:$ATD_HOME/service/code" "-Dsleep.debug=24" "-classpath" "./lib/sleep.jar:./lib/moconti.jar:./lib/spellutils.jar:./lib/*" "httpd.Moconti" "atdconfig.sl")
    :cwd "/Users/zaccaria/development/github/after-the-deadline-server/atd"
    :tags '(grammar)
    :kill-signal 'sigterm
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Language Tool"
    :command "/usr/local/bin/languagetool-server"
    :tags '(grammar)
    :kill-process-buffer-on-stop t)
  )

