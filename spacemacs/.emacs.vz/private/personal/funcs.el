;;; functions.el --- Summary


(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun kill-current-buffer-if-unmodified ()
  "Kill current buffer unconditionally."
  (interactive)
  (let ((buffer-modified-p nil))
    (kill-buffer (current-buffer))))

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun figlet-region (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -d ~/.figlet -f 3d" (current-buffer) t)
  (comment-region (mark) (point)))

(defun beautify-c ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun beautify-lisp (&optional b e)
  "Indent the currently visited buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun beautify-markdown (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
                           "pandoc -s --read markdown --write markdown-simple_tables+pipe_tables-fenced_code_blocks-fenced_code_attributes" (current-buffer) t))

(defun beautify-haskell (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
                           "stack exec stylish-haskell" (current-buffer) t))

(defun vz/accentize (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
                           "sed -E \"s/iu'/iù/g; s/uo'/uò/g; s/perche'/perchè/g; s/poiche'/poiché/g; s/a'/à/g; s/ e'/ è/g; s/c'e'/c'è/g; s/cosi'/così/g\"" (current-buffer) t))


(defun beautify-org (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
                           "pandoc --columns=80 --read org --write org" (current-buffer) t))

(defun beautify-asciidiag (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
                           "/usr/local/bin/org2kf -a" (current-buffer) t))


(defun beautify (&optional b e)
  (interactive "r")
  (cond ((derived-mode-p 'org-mode)        (call-interactively 'beautify-org))
        ((derived-mode-p 'emacs-lisp-mode) (call-interactively 'beautify-lisp))
        ((derived-mode-p 'markdown-mode)   (call-interactively 'beautify-markdown))
        ((derived-mode-p 'c-mode)          (call-interactively 'beautify-c))
        ((derived-mode-p 'json-mode)       (call-interactively 'web-beautify-js))
        ((derived-mode-p 'js-mode)         (call-interactively 'web-beautify-js))
        ((derived-mode-p 'html-mode)       (call-interactively 'web-beautify-html))
        ((derived-mode-p 'web-mode)        (call-interactively 'web-mode-buffer-indent))
        ((derived-mode-p 'haskell-mode)    (call-interactively 'haskell-mode-stylish-buffer))
        (t "not implemented")))

(defun vz/find-next-unsafe-char (&optional coding-system)
  "Find the next character in the buffer that cannot be encoded by
coding-system. If coding-system is unspecified, default to the coding
system that would be used to save this buffer. With prefix argument,
prompt the user for a coding system."
  (interactive "Zcoding-system: ")
  (if (stringp coding-system) (setq coding-system (intern coding-system)))
  (if coding-system nil
    (setq coding-system
          (or save-buffer-coding-system buffer-file-coding-system)))
  (let ((found nil) (char nil) (csets nil) (safe nil))
    (setq safe (coding-system-get coding-system 'safe-chars))
    ;; some systems merely specify the charsets as ones they can encode:
    (setq csets (coding-system-get coding-system 'safe-charsets))
    (save-excursion
      ;;(message "zoom to <")
      (let ((end  (point-max))
            (here (point    ))
            (char  nil))
        (while (and (< here end) (not found))
          (setq char (char-after here))
          (if (or (eq safe t)
                  (< char ?\177)
                  (and safe  (aref safe char))
                  (and csets (memq (char-charset char) csets)))
              nil ;; safe char, noop
            (setq found (cons here char)))
          (setq here (1+ here))) ))
    (and found (goto-char (1+ (car found))))
    found))

(defun vz/set-font-square ()
  "Just sets the font to square"
  (interactive)
  (set-face-attribute 'default nil :font "Square")
  )

(defun vz/set-font-hasklig ()
  "Just sets the font to square"
  (interactive)
  (set-face-attribute 'default nil :font "Hasklig")
  )

(defun vz/define-checker-for-stm32 ()
  "Sets the correct checker for the PlatformIO env"
  (interactive)

  (customize-set-variable 'flycheck-c/c++-gcc-executable "/Users/zaccaria/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-g++")
  (customize-set-variable 'flycheck-gcc-language-standard "c++11")
  (flycheck-select-checker 'c/c++-gcc))

(defun vz/define-checker-for-labs()
  "Sets the correct checker for infob labs"
  (interactive)

  (customize-set-variable 'flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-5")
  (flycheck-select-checker 'c/c++-gcc))

;; for the next function
(defun my-reload-dir-locals-for-current-buffer ()
  "reload dir locals for the current buffer"
  (interactive)
  (let ((enable-local-variables :all))
    (hack-dir-local-variables-non-file-buffer)))

(defun vz/reload-dirlocals ()
  "For every buffer with the same `default-directory` as the
current buffer's, reload dir-locals."
  (interactive)
  (let ((dir default-directory))
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (equal default-directory dir))
        (my-reload-dir-locals-for-current-buffer)))))

(require 'json)
(defun org-as-json-to-file ()
  "Export the current Org-mode buffer as JSON to the supplied PATH."
  (interactive)
  (let ((tree (org-element-parse-buffer)))
    (org-element-map tree
        (append org-element-all-objects org-element-all-elements)
      (lambda (el) (org-element-put-property el :parent nil)))
    (org-element-map tree
        (append org-element-all-objects org-element-all-elements)
      (lambda (el) (org-element-put-property el :structure nil)))
    (let ((oldbuf (current-buffer)))
      (set-buffer (get-buffer-create "data.json"))
      (insert (json-encode tree))
      (write-region nil nil "./data.json")
      (set-buffer oldbuf)
      )
    )
  )

(defun process-org-json ()
  "Process a json generated from an org file."
  (interactive)
  (org-as-json-to-file)
  (shell-command "make"))

(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.emacs.d/desktops/")
  "*Directory to save desktop sessions in")


(defvar my-desktop-session-name-hist nil
  "Desktop session name history")

(defun my-desktop-save (&optional name)
  "Save desktop with a name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session as: ")))
  (make-directory (concat my-desktop-session-dir name) t)
  (desktop-save (concat my-desktop-session-dir name) t))

(defun my-desktop-read (&optional name)
  "Read desktop with a name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Load session: ")))
  (desktop-read (concat my-desktop-session-dir name)))

(defun my-desktop-get-session-name (prompt)
  (completing-read prompt (and (file-exists-p my-desktop-session-dir)
                               (directory-files my-desktop-session-dir))
                   nil nil nil my-desktop-session-name-hist))

(defun term-fix-mouse ()
  "Fix mouse in tmux term"
  (interactive)
  (load-file "~/.emacs.vz/keymap/mouse.el")
  )


(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(defun vz/align-code-to-equals ()
  (interactive)
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil))

(defun vz/align-around-commas ()
  (interactive)
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)," 1 1 t))

(defun vz/align-around-colons ()
  (interactive)
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\):" 1 1 t))

(defun vz/next-error ()
  (interactive)
  (spacemacs/next-error)
  )

(defun vz/previous-error ()
  (interactive)
  (spacemacs/previous-error)
  )

(defun org-text-bold () "Wraps the region with asterisks."
       (interactive)
       (surround-text "*"))
(defun org-text-italics () "Wraps the region with slashes."
       (interactive)
       (surround-text "/"))
(defun org-text-code () "Wraps the region with equal signs."
       (interactive)
       (surround-text "="))

(defun djr/mu4e-view-related-search (msg)
  "Search for related messages to the current one"
  (let* ((msgid (mu4e-msg-field msg :message-id)))
    (setq mu4e-headers-include-related t)
    (mu4e-headers-search (concat "msgid:" msgid))))

(defun djr/mu4e-mark-thread-as-read ()
  (interactive)
  (mu4e-headers-mark-thread-using-markpair '(read)))

(defun djr/mu4e-open-message-in-google (msg)
  (let* ((msgid (mu4e-message-field msg :message-id))
         (url (concat "https://mail.google.com/mail/u/0/?shva=1#search/rfc822msgid%3A"
                      (url-encode-url msgid))))
    (start-process "" nil "open" url)))

(defun vz/open-inbox ()
  (interactive)
  (mu4e-headers-search-bookmark "maildir:/INBOX")
  )

(defun vz/open-today ()
  (interactive)
  (mu4e-headers-search-bookmark "date:today..now")
  )

(defun vz/spell-it (args)
  (interactive "P")
  (flyspell-mode 1)
  (ispell-change-dictionary "it" nil)
  (flyspell-buffer)
  )

(defun vz/spell-en (args)
  (interactive "P")
  (flyspell-mode 1)
  (ispell-change-dictionary "en" nil)
  (flyspell-buffer)
  )

(defun vz/switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "italiano") "en_US" "italiano")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)))

                                        ;(defun vz/open-today()
                                        ;  (interactive)
                                        ;  (mu4e-headers-search-bookmark "date:today..now")
                                        ;  )
;;

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))

(defun vz/mu4e-justexecute()
  "Just exec without confirmation."
  (interactive)
  (mu4e-mark-execute-all t))

(provide 'functions)
;;; functions.el ends here
