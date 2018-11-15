;;; packages.el --- personal layer packages file for Spacemacs.


(defconst personal-packages
  '(
    spell-checking
    prodigy
    evil-multiedit
    livescript-mode
    matlab-mode
    markdown-mode
    (ox-extra :location local)
    (ox-reveal :location local)
    (org-misc :location local)
    ))





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

(defun personal/post-init-markdown-mode ()
  (add-to-list 'auto-mode-alist '("/neomutt\\-.*" . markdown-mode))
  (add-hook 'markdown-mode-hook (lambda ()
                                  (ispell-change-dictionary "italiano")))
  )

;; define initialization here
(defun personal/init-org-misc ()
  (use-package org-misc
    :config
    (personal/org-init-agenda)
    (personal/org-init-babel)
    (personal/org-init-display)
    (personal/org-init-snippets)
    (personal/org-init-latex)
    (personal/org-init-pomodoro)
    (personal/org-init-keybindings)
    (personal/org-init-links)
    )
  )


(defun personal/init-evil-multiedit ()
  (use-package evil-multiedit
    :config
    (progn
      (evil-multiedit-default-keybinds)
      )
    )
  )



;; (defun personal/post-init-org-bullets ()
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;   )

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


(defun personal/init-ox-reveal ()
  (use-package ox-reveal)
  )

(defun personal/init-ox-extra ()
  (use-package ox-extra
    :config
    (ox-extras-activate '(ignore-headlines))
    )
  )

