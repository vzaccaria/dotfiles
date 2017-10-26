;;; packages.el --- personal layer packages file for Spacemacs.


(defconst personal-packages
  '(
    org
    org-bullets
    spell-checking
    prodigy
    evil-multiedit
    livescript-mode
    highlight-chars
    pretty-mode
    writeroom-mode
    matlab-mode
    (ox-extra :location local)
    (prettier-js :location local)
    ))


(defun personal/init-pretty-mode ()
  (use-package pretty-mode
    :init
    (progn (global-pretty-mode t)

           (pretty-deactivate-groups
            '(:equality :ordering :ordering-double :ordering-triple
                        :arrows :arrows-twoheaded :punctuation
                        :logic :sets))

           (pretty-activate-groups
            '(:sub-and-superscripts :greek :arithmetic-nary))
           (global-prettify-symbols-mode 1)
           ;; See here for adding symbols to your major mode: https://ekaschalk.github.io/
           (add-hook
            'haskell-mode-hook
            (lambda ()
              (mapc (lambda (pair) (push pair prettify-symbols-alist))
                    '(;; Syntax
                      ("`nd`" .#x2227)
                      (".&"   .#x2227)
                      ("`xr`" .#x2295)
                      (".+"   .#x2295)
                      ("nt"   .#x00ac)
                      ("neg"  .#x00ac)
                      (".|"   .#x2228)
                      ("_0"   .#x2080)
                      ("_1"   .#x2081)
                      (".<>"  .#x20df)
                      ("top"  .#x22a4)
                      ("bot"  .#x22a5)
                      ))))
           (add-hook 'LaTeX-mode-hook
                     (lambda ()
                       (push '("\\item"    . ?●) prettify-symbols-alist)
                       (push '("\\begin{itemize}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{itemize}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{example}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{example}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{theorem}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{theorem}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{proof}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{proof}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{definition}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{definition}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{equation}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{equation}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{equation*}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{equation*}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{eqnarray*}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{eqnarray*}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{eqnarray}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{eqnarray}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{remark}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{remark}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{corollary}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{corollary}"    . ?↲) prettify-symbols-alist)
                       (push '("\\begin{align}"    . ?↴) prettify-symbols-alist)
                       (push '("\\end{align}"    . ?↲) prettify-symbols-alist)
                       ))
           ))
  )

(defun personal/init-highlight-chars ()
  (use-package highlight-chars)
  )

(defun personal/init-livescript-mode ()
  (use-package livescript-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.ls\\'" . livescript-mode))
      (evil-leader/set-key-for-mode 'livescript-mode
        "mc" 'livescript-compile-buffer
        "mC" 'livescript-compile-region
        "mr" 'livescript-repl)
      (add-hook 'livescript-mode-hook '(lambda ()
                                         (setq livescript-command "lsc"))
                )
      )))


(defun personal/post-init-spell-checking ()
  (setq-default ispell-program-name "/usr/local/bin/aspell")
  )

(defun personal/post-init-matlab-mode ()
  (add-to-list
   'auto-mode-alist
   '("\\.m$" . matlab-mode))
  (setq matlab-indent-function t)
  (setq matlab-shell-command "/Applications/MATLAB_R2015b.app/bin/matlab")
  )

;; define initialization here
(defun personal/post-init-org ()
  (require 'org-protocol)
  (require 'org-drill)
  (require 'ox)
  (setq org-agenda-custom-commands '(("w" "My Agenda"
                                      ((agenda "")
                                       (tags "TODO=\"TODAY\"")
                                       (tags "TODO=\"IMPORTANT\"&-PRIORITY=\"C\"")
                                       (tags "TODO=\"IMPORTANT\"&PRIORITY=\"C\"")
                                       (tags "DEADLINE={.}-TODO=\"DONE\"")
                                       (tags "TODO=\"TODO\"&-TODO=\"IMPORTANT\"")
                                       ))))

  (setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM") 
  (setq org-agenda-todo-list-sublevels nil)

  ;; Add files recursively
  (load-library "find-lisp")
  (setq org-agenda-files
        (find-lisp-find-files "~/Dropbox/org" "_ag\.org$"))

  (setq org-todo-keywords
        '((sequence "TODO" "TODAY" "IMPORTANT" "CHECK" "|" "DONE" "CANCELLED")
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
   '(
     (emacs-lisp . t)
     (shell . t)
     (haskell . t)
     (js . t)
     (C . t)  
     (ditaa . t)
     (plantuml . t)
     (latex . t)
     ))


  (org-add-link-type "papers3" (lambda (link)  (shell-command (concat "open papers3:" link))))

  (setq org-babel-js-cmd "node")
  (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.16/libexec/plantuml.jar")
  (setq org-capture-templates
        '(
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

  (setf org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

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

     ;;; --- SOURCES: netlist from verilog module (needs mine netlistsvg, ps2pdf, yosys, pdfcrop)
          ("ssv" "#+NAME: halfadder\n#+BEGIN_SRC verilog :exports none\nmodule singleAdder(\n   input  a,\n   input  b,\n   input  cin,\n   output s,\n   output cout );\n   assign s = a ^ b ^ cin;\n   assign cout = (a & b)  |  (a & cin)  |  (b & cin);\nendmodule\n#+END_SRC\n\n# if you change the verilog module, reevaluate with C-c\n#+BEGIN_SRC sh :results silent :exports none :noweb yes\ncat <<EOF | netlistsvg netlist --verilog | ps2pdf - | pdfcrop - images/bool_half_adder.pdf\n<<halfadder>>\nEOF \n#+END_SRC \n\n#+attr_latex: :width 0.55\\linewidth :float t :placement [h]\n[[file:images/bool_half_adder.pdf]]\n")

     ;;; --- SOURCES: wave files (needs phantomjs)
          ("ssw" "#+NAME: segnale\n#+BEGIN_SRC js :exports none\n { signal: [\n { name: \"clk\",         wave: \"p.....|...\" },\n { name: \"Data\",        wave: \"x.345x|=.x\", data: [\"head\", \"body\", \"tail\", \"data\"] },\n { name: \"Request\",     wave: \"0.1..0|1.0\" },\n {},\n { name: \"Acknowledge\", wave: \"1.....|01.\" }\n]} \n#+END_SRC\n\n# if you change the verilog module, reevaluate with C-c \n #+BEGIN_SRC shell :results silent :exports none :noweb yes\ncat <<EOF | netlistsvg wave | ps2pdf - | pdfcrop - images/bool_wave.pdf \n<<segnale>>\n #+END_SRC  \n \n #+attr_latex: :width 0.55\\linewidth :float t :placement [h] \n [[file:images/bool_wave.pdf]] \n")

     ;;; --- FIGURES ---
          ("fe" "#+BEGIN_EXPORT latex\n\\begin{figure}\n\n\\end{figure}\n#+END_EXPORT")
          ("fc" "#+CAPTION: caption with label \\label{l1}\n#+attr_latex: :width 0.85\\linewidth :float t :placement [h]")
          ("tg" "\\begin{tikzpicture}\n\\graph[layered layout, level distance=1cm]{ a -> {b, c} };\n\\end{tikzpicture}")
          ("tc" "\\begin{tikzpicture}[start chain=1 going right,node distance=5mm] \n \\node [draw,on chain=1] {Hello}; \n\\node [draw,on chain] {World}; \n\\end{tikzpicture}")

     ;;; --- GENERIC LATEX

          ("als" "#+attr_latex: :font \\footnotesize")
          ("al" "#+attr_latex: :font \\footnotesize :width 0.85\\linewidth :float t :placement [h]")
          ("alf" "#+attr_latex: :width 0.85\\linewidth :float t :placement [h]")

     ;;; --- EXAMPLES ---
          ("ec" "#+begin_center \n #+attr_latex: :options {0.7\\textwidth} \n #+begin_minipage \n #+BEGIN_EXAMPLE \n #+END_EXAMPLE \n #+end_minipage \n #+end_center \n")

     ;;; --- EQUATIONS --- 
          ("equ" "#+BEGIN_EXPORT latex\n\\begin{equation}\n\\end{equation}\n#+END_EXPORT")
          ("eqc" "f(x) = \\begin{cases}\n 1 & \\text{for } n = 0 \\\\ \n \\end{cases}\n")
          ("eqa" "\\begin{array}{rcl}\n a& = &b \\\\\n\\end{array}\n")
          ("eql" "#+BEGIN_EXPORT latex\n\\begin{align}\n a& = &b \\\\\n\\end{align}\n#+END_EXPORT")

     ;;; --- MATRICES ---
          ("mat" "M = \\left(\\begin{array}{ccc}\n a& = &b \\\\\n\\end{array}\\right)\n")

     ;;; --- MINI PAGES and COLUMNS
          ("hp" "#+attr_latex: :options {0.5\\textwidth}\n#+begin_minipage\n\n#+end_minipage")
          ("btc" "***\n :PROPERTIES:\n :BEAMER_env: column\n :BEAMER_col: 0.5\n :END:\n  #+BEGIN_footnotesize \n\n #+END_footnotesize \n")
          ("brc" "***\n :PROPERTIES:\n :BEAMER_env: column\n :BEAMER_col: 0.32\n :END:\n #+BEGIN_footnotesize \n\n #+END_footnotesize \n"))
        )




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

  (setq org-pomodoro-finished-sound "/Users/zaccaria/dotfiles/spacemacs/.emacs.vz/private/personal/assets/pomodoro0.wav")
  (setq org-pomodoro-long-break-sound "/Users/zaccaria/dotfiles/spacemacs/.emacs.vz/private/personal/assets/pomodoro0.wav")
  (setq org-pomodoro-short-break-sound "/Users/zaccaria/dotfiles/spacemacs/.emacs.vz/private/personal/assets/pomodoro0.wav")

  ;; Override general keybindings for orgmode

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

  (define-key org-mode-map (kbd "M-p")  'org-preview-latex-fragment)

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 0.7))

  )


(defun personal/init-evil-multiedit ()
  (use-package evil-multiedit
    :config
    (progn
      (evil-multiedit-default-keybinds)
      )
    )
  )

(defun personal/init-writeroom-mode ()
  (use-package writeroom-mode
    :commands (writeroom-mode)
    :init
    (evil-leader/set-key "Tw" 'writeroom-mode)
    :config
    (setq writeroom-restore-window-config t)
    (setq writeroom-width 100)
    ))


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

(defun personal/init-helm-mu ()
  (use-package helm-mu
    :defer t
    :commands helm-mu
    :init
    (require 'helm-config)
    (spacemacs/set-leader-keys "oM" 'helm-mu
      "oC" 'helm-mu-contacts))
  ) 


(defun personal/init-mu4e ()
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
          mu4e-update-interval 360
          mu4e-split-view 'horizontal 
          mu4e-headers-auto-update t
          mu4e-hide-index-messages t
          mu4e-headers-leave-behavior 'apply
          mu4e-headers-visible-columns 100
          mu4e-compose-signature-auto-include nil
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
          `(
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
                        ))

            ,(make-mu4e-context
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

            ))

    (setq mu4e-context-policy 'pick-first)
    (setq mu4e-compose-context-policy 'pick-first)

    ;; This sets `mu4e-user-mail-address-list' to the concatenation of all
    ;; `user-mail-address' values for all contexts. If you have other mail
    ;; addresses as well, you'll need to add those manually.
    (setq mu4e-user-mail-address-list
          (delq nil
                (mapcar (lambda (context)
                          (when (mu4e-context-vars context)
                            (cdr (assq 'user-mail-address (mu4e-context-vars context)))))
                        mu4e-contexts)))

    ;; make sure the gnutls command line utils are installed
    ;; package 'gnutls-bin' in Debian/Ubuntu

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


    (add-hook 'mu4e-compose-mode-hook
              (defun my-do-compose-stuff ()
                "My settings for message composition."
                (set-fill-column 72)
                (ispell-change-dictionary "italiano")
                ))

    (add-hook 'mu4e-headers-mode-hook
              (defun my-headers-mode-customization ()
                "My settings for headers mode"
                (define-key mu4e-headers-mode-map (kbd "<mouse-1>") 'mu4e-headers-view-message)
                )
              )


    (setq mu4e-maildir-shortcuts
          '( ("/INBOX"       . ?i)
             ("/Sent Mail"   . ?s)
             ("/Drafts"      . ?d)
             ("/Trash"       . ?t)
             ("/All Mail"    . ?a)))
    )
  )

(defun personal/init-ox-extra ()
  (use-package ox-extra
    :config
    (ox-extras-activate '(ignore-headlines))
    )
  )

(defun personal/init-prettier-js ()
  (use-package prettier-js
    :config
    (add-hook 'js-mode-hook
              (lambda ()
                (add-hook 'before-save-hook 'prettier-before-save)))
    
  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'prettier-before-save)))

  (add-hook 'react-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'prettier-before-save)))
  )
  )

