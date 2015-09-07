(require 'ox-latex)
(require 'ox-beamer)

(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-latex-minted-options
   '(("obeytabs" "true") ("baselinestretch" "0.95")))

(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
