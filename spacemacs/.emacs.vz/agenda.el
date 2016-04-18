(setq org-agenda-custom-commands '(("w" "My Agenda" ((agenda "") (todo "")))))
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

;;;
