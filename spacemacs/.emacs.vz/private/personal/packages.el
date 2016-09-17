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
    mu4e
    helm-mu
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

  (setf org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))

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


  ;; duplicated.. dont ask me..
  ;; the following are needed to compile correctly lecture files.
  (unless (boundp 'org-export-latex-classes)
    (setq org-export-latex-classes nil))

  (add-to-list 'org-export-latex-classes
               '("article"
                 "\\documentclass\{article\}
                [NO-DEFAULT-PACKAGES]"
                 ("\\section\{%s\}" . "\\section*\{%s\}")
                 ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                 ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

      ;;; same for beamer
  (add-to-list 'org-export-latex-classes
               '("beamer"
                 "\\documentclass\[presentation\]\{beamer\}
                [NO-DEFAULT-PACKAGES]"
                 ("\\section\{%s\}" . "\\section*\{%s\}")
                 ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                 ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))
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



;; (defun personal/init-helm-mu ()
;;   (spacemacs/set-leader-keys
;;     "a m s" 'helm-mu
;;     "a m c" 'helm-mu-contacts))

(defun my-mu4e/init-helm-mu ()
  (use-package helm-mu
    :defer t
    :commands helm-mu
    :init (spacemacs/set-leader-keys "oM" 'helm-mu
            "oC" 'helm-mu-contacts))
    )


(defun personal/pre-init-mu4e ()
  (use-package mu4e
    :defer t
    :commands mu4e
    :config
    (setq mu4e-maildir "~/mu-mail/")
    (setq mu4e-get-mail-command "offlineimap -f INBOX")
    (setq mu4e-trash-folder "/[Gmail].Trash"
          mu4e-refile-folder "/[Gmail].All Mail"
          mu4e-sent-folder "/[Gmail].Sent Mail"
          mu4e-drafts-folder "/[Gmail].Drafts"
          ;; update every 5 minutes
          mu4e-update-interval 300
          mu4e-split-view 'horizontal 
          mu4e-headers-auto-update t
          mu4e-headers-leave-behavior 'apply
          mu4e-headers-visible-columns 100
          mu4e-compose-signature-auto-include nil
          mu4e-compose-complete-only-personal t
          mu4e-view-show-images t
          mu4e-view-show-addresses t)

    ;; don't keep message buffers around
    (setq message-kill-buffer-on-exit t)
    (setq mu4e-use-fancy-chars  t
          mu4e-headers-attach-mark '("" . "")
          mu4e-headers-encrypted-mark '("" . "")
          mu4e-headers-flagged-mark '("+" . "⚑")
          mu4e-headers-list-mark '("" . "")
          mu4e-headers-new-mark '("" . "")
          mu4e-headers-read-mark '("" . "")
          mu4e-headers-replied-mark '("" . "↩")
          mu4e-headers-seen-mark '("" . "")
          mu4e-headers-unseen-mark '("" . "")
          mu4e-headers-unread-mark '("" . "✱")
          mu4e-headers-signed-mark '("" . "")
          mu4e-headers-from-or-to-prefix '("" . "→ ")
          mu4e-headers-has-child-prefix '("+" . "└┬")
          mu4e-headers-first-child-prefix '("|" . "├")
          mu4e-headers-default-prefix '("" . "├"))



    (setq mu4e-sent-messages-behavior 'delete)

    (setq mu4e-contexts
          `( ,(make-mu4e-context
               :name "Private"
               :enter-func (lambda () (mu4e-message "Switch to the Private context"))
               ;; leave-func not defined

               :match-func (lambda (msg)
                             (let ((email "vittorio.zaccaria@gmail.com"))
                               (when msg
                                 (or
                                  (mu4e-message-contact-field-matches msg :to email)
                                  (mu4e-message-contact-field-matches msg :cc email)
                                  (mu4e-message-contact-field-matches msg :from email)
                                  ))))


               :vars '(  ( user-mail-address	. "vittorio.zaccaria@gmail.com"  )
                         ( user-full-name	    . "Vittorio Zaccaria" )
                         ))

            ,(make-mu4e-context
              :name "Work"
              :enter-func (lambda () (mu4e-message "Switch to Work Context"))
              ;; leave-func not defined

              :match-func (lambda (msg)
                            (let ((email "vittorio.zaccaria@polimi.it"))
                              (when msg
                                (or
                                  (mu4e-message-contact-field-matches msg :to email)
                                  (mu4e-message-contact-field-matches msg :cc email)
                                  (mu4e-message-contact-field-matches msg :from email)
                                  ))))


              :vars '(  ( user-mail-address	. "vittorio.zaccaria@polimi.it"  )
                        ( user-full-name	    . "Vittorio Zaccaria" )
                        ))))

    ;; This sets `mu4e-user-mail-address-list' to the concatenation of all
    ;; `user-mail-address' values for all contexts. If you have other mail
    ;; addresses as well, you'll need to add those manually.
    (setq mu4e-user-mail-address-list
          (delq nil
          (mapcar (lambda (context)
                    (when (mu4e-context-vars context)
                      (cdr (assq 'user-mail-address (mu4e-context-vars context)))))
                  mu4e-contexts)))

    (setq message-send-mail-function 'smtpmail-send-it
          starttls-use-gnutls t
          smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
          smtpmail-auth-credentials
          '(("smtp.gmail.com" 587 "vittorio.zaccaria@gmail.com" nil))
          smtpmail-default-smtp-server "smtp.gmail.com"
          smtpmail-smtp-server "smtp.gmail.com"
          smtpmail-smtp-service 587)

    ;; headers view
    (setq mu4e-headers-results-limit 500
          mu4e-headers-show-threads t
          ;; mu4e-headers-skip-duplicates t
          mu4e-headers-date-format "%d %b %Y"
          mu4e-headers-time-format "%H:%M"
          mu4e-headers-fields
          '( (:human-date     .  15)
             (:flags          .   5)
             (:from           .  30)
             (:subject        .  nil))
          mu4e-headers-sort-field :date
          mu4e-headers-sort-direction 'descending)

    (setq mu4e-bookmarks
          '(
          ("maildir:/INBOX"                        "Inbox"               ?i)
          ("date:today..now"                       "Today"               ?t)

          ))

    (spacemacs|use-package-add-hook mu4e
      :post-config
      (progn
        (add-to-list 'mu4e-view-actions '("gopen in gmail" . djr/mu4e-open-message-in-google) t)
        (add-to-list 'mu4e-view-actions '("rview related" . djr/mu4e-view-related-search) t)))



    (setq mu4e-maildir-shortcuts
          '( ("/INBOX"       . ?i)
             ("/Sent Mail"   . ?s)
             ("/Drafts"      . ?d)
             ("/Trash"       . ?t)
             ("/All Mail"    . ?a)))
  )
)
