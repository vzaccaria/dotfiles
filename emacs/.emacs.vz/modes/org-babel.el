(require 'ox-ioslide)
(load-file "~/.emacs.vz/modes/ob-mathematica.el")

(package-require 'ob-haskell)

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
    (plantuml . t)
    (haskell . t)
    (mathematica . t)))

(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8024/plantuml.8024.jar")
