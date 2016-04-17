(require 'ox)
(require 'ox-latex)

(add-to-list 'org-latex-classes
             '("beamer"
                "\\documentclass\[presentation\]\{beamer\}
                [NO-DEFAULT-PACKAGES]"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(add-to-list 'org-latex-classes
             '("article"
                "\\documentclass\{article\}
                [NO-DEFAULT-PACKAGES]"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))


(require 'ox-beamer)
(require 'ox-html)
(require 'ox-md)
(require 'ox-gfm)

(setq org-latex-minted-options
   '(("obeytabs" "true") ("baselinestretch" "0.95")))

(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process
      '("/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "/usr/local/texlive/2013/bin/universal-darwin/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
