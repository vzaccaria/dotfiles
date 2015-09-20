(require 'ox)
(require 'ox-latex)

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(require 'ox-beamer)
(require 'ox-html)
(require 'ox-md)
(require 'ox-gfm)


(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-latex-minted-options
   '(("obeytabs" "true") ("baselinestretch" "0.95")))

(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
