(require 'org)

(load-file "~/.emacs.vz/modes/ox-latex.el")
(load-file "~/.emacs.vz/modes/org-babel.el")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-src-preserve-indentation t)

(setq org-capture-templates
      '(
        ("m" "Send mail to" entry
         (file+headline "~/Dropbox/org/work.org" "Ricordarsi di ...")
         "* TODO Send mail to  %?\n  %i\n")

        ("t" "Work todo generico" entry
         (file+headline "~/Dropbox/org/work.org" "Ricordarsi di ...")
         "* TODO %?\n  %i\n")

        ("i" "Nuova idea progetto o tesi" entry
         (file+headline "~/Dropbox/org/thesis.org" "Project/Thesis proposals")
         "*  %?\n")

        ("l" "Posts da leggere" entry (file+headline "~/Dropbox/org/work.org" "Non so")
         "* [ ] %?\n")

        ("d" "Risorse per Informatica B" entry i
         (file+headline "/Users/zaccaria/development/github/documents/lectures/infob/materiale/InfoBMat.org" "Risorse da organizzare")
         "*  %?\n")

        ("o" "Todo per organizzazione di Informatica B" entry
         (file+headline "/Users/zaccaria/Dropbox/Commuting/Ricercatore TI 2011/Lezioni/2015-2016 Informatica B/InfoBOrg.org" "Todo")
         "*  %?\n")

        )
      )
