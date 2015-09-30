(require 'ox-ioslide)

(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
    (sh . t)
    (octave . t)
    (R . t)
    (C . t)
    (js . t)
    (ledger . t)
    (ditaa . t)
    (plantuml . t)))

(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8024/plantuml.8024.jar")
