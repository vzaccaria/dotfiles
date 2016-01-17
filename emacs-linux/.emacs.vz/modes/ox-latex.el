(package-require 'ox)
(package-require 'ox-latex)

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


(package-require 'ox-beamer)
(package-require 'ox-html)
(package-require 'ox-md)
(package-require 'ox-gfm)

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
