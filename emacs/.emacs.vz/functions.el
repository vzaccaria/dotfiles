(defun vz/open-infob-file ()
     (interactive)
        (find-file "/Users/zaccaria/development/github/documents/lectures/infob/materiale/InfoBMat.org"))

(defun vz/open-work-file ()
     (interactive)
     (find-file "/Users/zaccaria/Dropbox/org/work.org"))

(defun vz/open-thesis-file ()
     (interactive)
     (find-file "/Users/zaccaria/Dropbox/org/thesis.org"))

(defun vz/open-cucina-file ()
     (interactive)
     (find-file "/Users/zaccaria/Dropbox/Commuting/Altro/Personal/Chiara/Casa/Viale Varese/Cucina Viale Varese - Settembre 2015/cucina.org"))

(defun vz/open-st-file ()
     (interactive)
     (find-file "/Users/zaccaria/Dropbox/org/STMicro.org"))

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


(defun beautify-markdown (&optional b e)
  (interactive "r")
  (shell-command-on-region (point-min) (point-max)
    "pandoc -s --read markdown --write markdown-simple_tables+pipe_tables-fenced_code_blocks-fenced_code_attributes" (current-buffer) t))

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

;;
