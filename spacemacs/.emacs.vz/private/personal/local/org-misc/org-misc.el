(require 'org-protocol)
(require 'org-drill)
(require 'ox)

(defun personal/org-init-super-agenda ()
  (let ((org-super-agenda-groups
         '((:auto-group t))))
    (org-agenda-list))
  )

(defun personal/org-init-agenda ()
  (setq org-agenda-custom-commands '(("w" "My Agenda"
                                      ((agenda "")
                                       (tags "TODO=\"TODAY\"")
                                       (tags "DEADLINE<=\"<+1w>\"-TODO=\"DONE\"")
                                       (tags "TODO=\"TODO\"&-TODO=\"IMPORTANT\"")
                                       (tags "TODO=\"JAR\"")
                                       ))))

  (setq org-agenda-todo-list-sublevels nil)
  (load-library "find-lisp")

  (setq org-agenda-files
        (find-lisp-find-files "~/Dropbox/org" "_ag\.org$"))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "TODAY(d)" "JAR(j)" "|" "DONE")
          (sequence "TOREIMBURSE" "|" "REIMBURSED"  )))

  (add-hook 'org-mode-hook (lambda ()
                             (define-key org-mode-map "\M-e" 'personal/show-agenda-all)))

  (setq org-agenda-window-setup (quote current-window))

  (define-key global-map "\C-ct"
    (lambda () (interactive) (org-capture nil "t")))
  
  (define-key global-map "\C-cd"
    (lambda () (interactive) (org-capture nil "d")))

  (setq org-capture-templates
        '(
          ("d" "Work todo per oggi" entry
           (file+headline "~/Dropbox/org/institutional/work_ag.org" "Ricordarsi di ...")
           "* TODAY %?\n  %i\n")

          ("t" "Work todo generico" entry
           (file+headline "~/Dropbox/org/institutional/work_ag.org" "Ricordarsi di ...")
           "* TODO %?\n  %i\n")

          ("l" "Da leggere" entry
           (file+headline "~/Dropbox/org/institutional/work_ag.org" "Da categorizzare")
           "*** [ ] %c\n")

          ("c" "Note/Annotazioni per i corsi" entry
           (file+headline "~/Dropbox/org/institutional/work_ag.org" "Note per i corsi")
           "** %c - %i (%u)"
           )
          ))

  )

(defun personal/org-init-babel ()
  (setq org-confirm-babel-evaluate nil)


  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (shell . t)
     (haskell . t)
     (js . t)
     (C . t)
     (ditaa . t)
     (plantuml . t)
     (latex . t)
     (gnuplot . t)
     (python . t)
     (octave . t)
     ))
  (setq org-babel-js-cmd "node")
  (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.16/libexec/plantuml.jar")

  )

(defun personal/org-init-links ()
  (when vz/is-darwin
    (org-add-link-type "papers3" (lambda (link)  (shell-command (concat "open papers3:" link))))
    (org-add-link-type "skim" (lambda (link)  (shell-command (concat "skimk open \"skim:" link "\""))))
    (org-add-link-type "zotero" (lambda (link)  (shell-command (concat "skimk open \"zotero:" link "\"")))))
  (when vz/is-linux
    (org-add-link-type "zotero" (lambda (link)  (shell-command (concat "/home/admin/.nvm/versions/node/v6.9.5/bin/node /home/admin/.nvm/versions/node/v6.9.5/bin/skimk open \"zotero:" link "\" --zathura"))))
    )
  )

(defun nolinum ()
  (interactive)
  (message "Deactivated linum mode")
  (global-linum-mode 0)
  (linum-mode 0)
  )

(defun personal/org-init-display ()
  (setq org-columns-default-format "%40ITEM(Task) %20TAGS")
  ;; Using orgmode as a presentation
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t)
  (setq org-level-color-stars-only t )
  (add-hook 'org-mode-hook 'nolinum)
  )

(defun personal/org-init-snippets ()
  ;; USE THIS TO CREATE STRINGS: http://tomeko.net/online_tools/cpp_text_escape.php?lang=en
  (setq org-structure-template-alist
        '(("s" "#+BEGIN_SRC ?\n\n#+END_SRC")
          ("e" "#+BEGIN_EXAMPLE\n?\n#+END_EXAMPLE")
          ("q" "#+BEGIN_QUOTE\n?\n#+END_QUOTE")
          ("v" "#+BEGIN_VERSE\n?\n#+END_VERSE")
          ("V" "#+BEGIN_VERBATIM\n?\n#+END_VERBATIM")
          ("c" "#+BEGIN_CENTER\n?\n#+END_CENTER")
          ("l" "#+BEGIN_EXPORT latex\n?\n#+END_EXPORT")
          ("L" "#+LaTeX: ")
          ("h" "#+BEGIN_EXPORT html\n?\n#+END_EXPORT")
          ("n" "*** Appunti                                                        :B_note:\n:PROPERTIES:\n:BEAMER_env: note\n:END:\n")
          ("H" "#+HTML: ")
          ("a" "#+BEGIN_EXPORT ascii\n?\n#+END_EXPORT")
          ("A" "#+ASCII: ")
          ("i" "#+INDEX: ?")
          ("I" "#+INCLUDE: %file ?")
          ("st" "#+STARTUP: showall indent latexpreview entitiespretty")
          ("oh" "#+TITLE:    Title\n#+INCLUDE: beamer_modern.org\n#+STARTUP: showall indent latexpreview entitiespretty")

     ;;; --- SOURCES ---
          ("so"  "#+BEGIN_SRC octave :results none   \n\n#+END_SRC")
          ("ss"  "#+BEGIN_SRC sh     :results none   \n\n#+END_SRC")
          ("sc"  "#+BEGIN_SRC c      :results none   \n\n#+END_SRC")
          ("sj"  "#+BEGIN_SRC js     :results none   \n\n#+END_SRC")
          ("sjt" "#+BEGIN_SRC js :tangle js/yourfile.js   \n\n#+END_SRC")

     ;;; --- SOURCES: nomnoml
          ("ssi" "#+BEGIN_SRC shell :results file :file tempo.pdf :exports results\n cat <<EOF | nomnoml -f svg | svg2pdf
 \n [<start>st]->[<state>plunder] \n [plunder]->[<choice>more loot] \n [more loot]->[st] \n [more loot] no ->[<end>e] \n EOF \n #+END_SRC \n #+attr_latex: :width 0.25\\linewidth :float t :placement [h] \n #+RESULTS: \n ")

          ("ssgrid" "#+BEGIN_SRC shell :results silent :exports none\ngridpdf 10 10
\n#+END_SRC \n[[file:./grid_ese_10x10.pdf]] \n ")

     ;;; --- SOURCES: gantt chart with mermaid
          ("gantt"  "#+BEGIN_SRC shell :results silent :exports none :noweb yes\n cat <<EOF | mmdc -i /dev/stdin -o ./gantt.pdf \n gantt\n       dateFormat  YYYY-MM-DD\n       title Allocazione tempo su progetti \n       \n       Section\n       First deliverable         :done,    2017-03-29,2017-07-29 \n       Second deliverable        :active,  2017-07-29,2017-11-29 \n       Third  deliverable        :         2017-11-29,2018-03-29 \n\n       section Other\n       (symbolic)            :active,  2017-09-01,2017-12-31 \n EOF \n#+END_SRC\n")

     ;;; --- SOURCES: gantt chart with mermaid
          ("ad"  "#+BEGIN_SRC shell :results silent :exports none :noweb yes\n cat <<EOF | mmdc -i /dev/stdin -o ./file.png \n sequenceDiagram \n
    Alice->>Bob: Hello Bob, how are you? \n alt is sick \n Bob->>Alice: Not so good :( \n else is well \n Bob->>Alice: Feeling fresh like a daisy \n end \n opt Extra response \n Bob->>Alice: Thanks for asking \n EOF \n#+END_SRC end");


     ;;; --- FIGURES ---
          ("fe" "#+BEGIN_EXPORT latex\n\\begin{figure}\n\n\\end{figure}\n#+END_EXPORT")
          ("fc" "#+CAPTION: caption with label \\label{l1}\n#+attr_latex: :width 0.85\\linewidth :float t :placement [h]\n[[file:images/file.pdf]]")


     ;;; --- OTHER
          
          ("ese" "#+BEGIN_exercise\n#+END_exercise")
          ("oss" "#+BEGIN_remark\n#+END_remark")
          ("exa" "#+ATTR_LATEX: :options [name]\n#+BEGIN_esempio\n#+END_esempio")
          ("def" "#+ATTR_LATEX: :options [name]\n#+BEGIN_definition\n#+END_definition")
          ("thm" "#+ATTR_LATEX: :options [name]\n#+BEGIN_theorem\n#+END_theorem")

     ;;; --- GENERIC LATEX

          ("als" "#+attr_latex: :font \\footnotesize")
          ("alt" "#+attr_latex: :align |ccc|cc|")
          ("al" "#+attr_latex: :font \\footnotesize :width 0.85\\linewidth :float t :placement [h]")
          ("alf" "#+attr_latex: :width 0.85\\linewidth :float t :placement [h]")

     ;;; --- EQUATIONS ---
          ("equ" "\\begin{equation}\n\\end{equation}\n")
          ("cases" "f(x) = \\begin{cases}\n 1 & \\text{for } n = 0 \\\\ \n \\end{cases}\n")
          ("array" "\\begin{array}{rcl}\n a& = &b \\\\\n\\end{array}\n")
          ("align" "\\begin{align*}\n a& = &b \\\\\n\\end{align*}\n")
          ("proof" "\\begin{align*}\n = & & \\eqprop{law} \\\\\n\\end{align*}\n")

     ;;; --- MATRICES ---
          ("pmatrix" "\\begin{pmatrix} a& b \\\\ c & d \\\\\n\\end{pmatrix}\n")

     ;;; --- MINI PAGES and COLUMNS
          ("hp" "#+BEGIN_EXPORT latex\n\\begin{minipage}[t]{0.55\\textwidth}\n#+END_EXPORT\n#+BEGIN_EXPORT latex\n\\end{minipage}\n#+END_EXPORT\n\\hspace{0.9cm}\n#+BEGIN_EXPORT latex\n\\begin{minipage}[t]{0.40\\textwidth}\n#+END_EXPORT\n#+BEGIN_EXPORT latex\n\\end{minipage}\n#+END_EXPORT\n"
           )
          ("btc" "***\n :PROPERTIES:\n :BEAMER_env: column\n :BEAMER_col: 0.5\n :END:\n  #+BEGIN_footnotesize \n\n #+END_footnotesize \n")
          ("brc" "***\n :PROPERTIES:\n :BEAMER_env: column\n :BEAMER_col: 0.32\n :END:\n #+BEGIN_footnotesize \n\n #+END_footnotesize \n"))
        )
  )

(defun personal/org-init-latex ()
  (setf org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))


  (setq bibtex-completion-display-formats
        '((article       . "${=has-notes=:1}${=has-pdf=:1} ${=type=:3} ${year:4} ${author:24}  ${title:*} ${journal:16}")
          (inbook        . "${=has-notes=:1}${=has-pdf=:1} ${=type=:3} ${year:4} ${author:24}  ${title:*} ${chapter:16}")
          (incollection  . "${=has-notes=:1}${=has-pdf=:1} ${=type=:3} ${year:4} ${author:24}  ${title:*} ${booktitle:16}")
          (inproceedings . "${=has-notes=:1}${=has-pdf=:1} ${=type=:3} ${year:4} ${author:24}  ${title:*} ${booktitle:16}")
          (t             . "${=has-notes=:1}${=has-pdf=:1} ${=type=:3} ${year:4} ${author:24}  ${title:*}")))


  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))

  (add-to-list 'org-latex-classes
               '("memoir"
                 "\\documentclass\{memoir\}
                [NO-DEFAULT-PACKAGES]"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 ))

  (add-to-list 'org-latex-classes
               '("IEEETran"
                 "\\documentclass\{IEEEtran\}
                [NO-DEFAULT-PACKAGES]"
                 ("\\section\{%s\}" . "\\section*\{%s\}")
                 ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                 ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
                 ))

  (add-to-list 'org-latex-classes
               '("article"
                 "\\documentclass[a4]\{article\}
                [NO-DEFAULT-PACKAGES]"
                 ("\\section\{%s\}" . "\\section*\{%s\}")
                 ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                 ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

  (add-to-list 'org-latex-classes
               '("letter"
                 "\\documentclass\{letter\}
                [NO-DEFAULT-PACKAGES]"
                 ))

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

  (setq org-export-default-inline-image-rule
        '(("file" . "\\.\\(gif\\|jp\\(?:e?g\\)\\|p\\(?:bm\\|df\\|gm\\|ng\\|pm\\)\\|tiff?\\|x\\(?:[bp]m\\)\\)\\'"))
        )

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2))

  )

(defun personal/org-init-pomodoro ()
  (setq org-pomodoro-finished-sound "/Users/zaccaria/dotfiles/spacemacs/.emacs.vz/private/personal/assets/pomodoro0.wav")
  (setq org-pomodoro-long-break-sound "/Users/zaccaria/dotfiles/spacemacs/.emacs.vz/private/personal/assets/pomodoro0.wav")
  (setq org-pomodoro-short-break-sound "/Users/zaccaria/dotfiles/spacemacs/.emacs.vz/private/personal/assets/pomodoro0.wav")
  )

(defun personal/org-init-keybindings ()
  (define-key org-read-date-minibuffer-local-map (kbd "\e [5D")
    (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-day 1))))
  (define-key org-read-date-minibuffer-local-map (kbd "\e [5C")
    (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-day 1))))
  (define-key org-read-date-minibuffer-local-map (kbd "\e [5E")
    (lambda () (interactive) (org-eval-in-calendar '(calendar-backward-week 1))))
  (define-key org-read-date-minibuffer-local-map (kbd "\e [5B")
    (lambda () (interactive) (org-eval-in-calendar '(calendar-forward-week 1))))

  ;; We want to use arrow keys for moving between windows in org-mode as well

  (define-key org-mode-map (kbd "\e <up>")   'evil-window-up)
  (define-key org-mode-map (kbd "\e <down>") 'evil-window-down)
  (define-key org-mode-map (kbd "\e <right>")'evil-window-right)
  (define-key org-mode-map (kbd "\e <left>") 'evil-window-left)

  (define-key org-mode-map (kbd "M-<up>")    'evil-window-up)
  (define-key org-mode-map (kbd "M-<down>")  'evil-window-down)
  (define-key org-mode-map (kbd "M-<right>") 'evil-window-right)
  (define-key org-mode-map (kbd "M-<left>")  'evil-window-left)

  (define-key org-mode-map (kbd "<f12>") (lambda () (interactive) (flyspell-auto-correct-previous-word))) 

  (define-key org-mode-map (kbd "M-p")  'org-preview-latex-fragment)
  (define-key org-mode-map (kbd "<f1>") (lambda () (interactive) (org-overview)))
  (define-key org-mode-map (kbd "<f2>") (lambda () (interactive) (org-global-cycle 2)))
  (define-key org-mode-map (kbd "<f3>") (lambda () (interactive) (org-global-cycle 3)))

  (evil-define-key 'normal evil-org-mode-map (kbd "M-b")  'spacemacs/org-bold)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-k")  'spacemacs/org-code)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-l")  'spacemacs/org-italic)
  (evil-define-key 'normal evil-org-mode-map (kbd "M-o")  'vz/switch-dictionary)
  )

(provide 'org-misc)
