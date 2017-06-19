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

;; (defun beautify-c ()
;;   "Indent the currently visited buffer."
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

(defun beautify-lisp (&optional b e)
  "Indent the currently visited buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun beautify-markdown (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
                           "pandoc -s --read markdown --write markdown-simple_tables+pipe_tables-fenced_code_blocks-fenced_code_attributes --atx-headers" (current-buffer) t))

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



(defun beautify-haskell (&optional b e)
  (interactive "r")
  (call-interactively 'hindent-reformat-buffer)
  (call-interactively 'recenter-top-bottom)
  (call-interactively 'haskell-mode-stylish-buffer)
  )

(defun beautify-latex (&optional b e)
  (interactive "r")
  (call-interactively 'LaTeX-fill-buffer)
  )

(defun vz/show-command-log-and-keys (&optional b e)
  (interactive "r")
  (global-command-log-mode t)
  )

(defun vz/recompile (&optional b e)
  (interactive)
  (cond
   ((derived-mode-p 'c-mode)          (call-interactively 'recompile))
   ((derived-mode-p 'haskell-mode)    (call-interactively 'haskell-process-load-file))
   (t "not implemented")))

(defun vz/go-to-interpreter(&optional b e)
  (interactive)
  (cond
   ((derived-mode-p 'haskell-mode)    (call-interactively 'haskell-interactive-switch))
   ((derived-mode-p 'haskell-interactive-mode)    (call-interactively 'haskell-interactive-switch-back))
   (t "not implemented")))

(defun vz/insert-braces ()
  (interactive)
  (if (region-active-p)
      (insert-pair 1 ?{ ?})
    (insert "{}")
    (backward-char)))

(defun beautify (&optional b e)
  (interactive "r")
  (cond ((derived-mode-p 'org-mode)        (call-interactively 'beautify-org))
        ((derived-mode-p 'emacs-lisp-mode) (call-interactively 'beautify-lisp))
        ((derived-mode-p 'markdown-mode)   (call-interactively 'beautify-markdown))
        ((derived-mode-p 'c-mode)          (call-interactively 'clang-format-buffer))
        ((derived-mode-p 'json-mode)       (call-interactively 'web-beautify-js))
        ((derived-mode-p 'js-mode)         (call-interactively 'prettier))
        ((derived-mode-p 'react-mode)      (call-interactively 'prettier))
        ((derived-mode-p 'html-mode)       (call-interactively 'web-beautify-html))
        ((derived-mode-p 'web-mode)        (call-interactively 'web-mode-buffer-indent))
        ((derived-mode-p 'haskell-mode)    (call-interactively 'beautify-haskell))
        ((derived-mode-p 'LaTeX-mode)      (call-interactively 'beautify-latex))
        ((derived-mode-p 'latex-mode)      (call-interactively 'beautify-latex))
        (t "not implemented")))

(defun beautify-haskell-before-save ()
  "Add this to .emacs to run refmt on the current buffer when saving."
  (interactive)
  (when (string-equal (symbol-name major-mode) 'haskell-mode) (beautify-haskell)))

(defun vz/anable-beautify-latex-before-save ()
  (interactive)
  (add-hook 'before-save-hook 'beautify-latex-before-save)
  )

(defun beautify-latex-before-save ()
  "Add this to .emacs to run refmt on the current buffer when saving."
  (interactive)
  (when (string-equal (symbol-name major-mode) 'latex-mode) (beautify-latex)))

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

(defun vz/define-checker-for-ghcjs ()
  "Sets the correct checker ghcjs projects"
  (interactive)
  (customize-set-variable 'flycheck-haskell-ghc-executable "ghcjs")
  (flycheck-select-checker 'haskell-ghc))

(defun vz/check-using-proselint ()
  (interactive)
  (flycheck-select-checker 'proselint)
  )

(defun vz/check-using-grammarcheck ()
  (interactive)
  (flycheck-select-checker 'grammar-gramcheck))

(defun vz/enable-writeroom ()
  (interactive)
  (load-theme 'spacemacs-light t)
  (enable-theme 'spacemacs-light)
  (writeroom-mode t)
)

(defun vz/disable-writeroom ()
  (interactive)
  (writeroom--disable)
  (enable-theme 'spacemacs-dark)
)

(defun vz/define-checker-for-labs()
  "Sets the correct checker for infob labs"
  (interactive)
  (customize-set-variable 'flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-5")
  (flycheck-select-checker 'c/c++-gcc))

(defun vz/disable-org-latex-preview-on-nonfile ()
  (interactive)
  (if (not (buffer-file-name))
      (setq-local org-startup-with-latex-preview nil)
    (setq org-startup-with-latex-preview t))
  )

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

(defun vz/replace-buffer-file-extension-to (ext)
  "Replace the extension of the current buffer file to `.EXT'."
  (interactive)
  (concat (file-name-base (buffer-file-name)) ext))

(defun vz/org-to-docx ()
  (interactive)
  (org-md-export-to-markdown)
   (shell-command (format "%s %s -o %s --reference-docx=./templates/clean-reference.docx"
                          "pandoc"
                          (shell-quote-argument (vz/replace-buffer-file-extension-to ".md"))
                          (shell-quote-argument (vz/replace-buffer-file-extension-to ".docx"))
  )))


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

(defun vz/org-current-word-bold ()
  (interactive)
  (spacemacs/org-bold))

(defun vz/org-current-word-code ()
  (interactive)
  (mark-word)
  (spacemacs/org-verbose))

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

(defun vz/switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "italiano") "en_US" "italiano")))
    (ispell-change-dictionary change)
    (flyspell-buffer)
    (message "Dictionary switched from %s to %s" dic change)))

                                        ;(defun vz/open-today() ;
                                        ;  (interactive) ;
                                        ;  (mu4e-headers-search-bookmark "date:today..now") ;
                                        ;  ) ;
;;

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))

(defun vz/mu4e-justexecute()
  "Just exec without confirmation."
  (interactive)
  (mu4e-mark-execute-all t))


(provide 'functions)
;;; functions.el ends here
