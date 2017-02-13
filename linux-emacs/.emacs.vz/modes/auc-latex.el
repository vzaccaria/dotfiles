(package-require 'tex)
(package-require 'auctex)
(package-require 'auctex-latexmk)

;;; Generic Tex configuration
;;; https://www.gnu.org/software/auctex/manual/auctex.html#Modes-and-Hooks

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)

(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; stop annoying questions about which command to execute
(setq TeX-command-force "")


(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(add-hook 'LaTeX-mode-hook '(lambda ()
                              (setq TeX-command-default "latexmk")
                              (setq ispell-dictionary "english")
                              ))

(add-hook 'LaTeX-mode-hook (lambda ()

                             (push
                              '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                                :help "Run latexmk on file")
                              TeX-command-list)

                             ;; enable CMD+SHIFT+Click to jump from latex to pdf viewer
                             (define-key LaTeX-mode-map [M-S-mouse-1] 'TeX-view)

                             ;; compile with
                             (define-key LaTeX-mode-map (read-kbd-macro "M-b") 'vz/latex-compile)
                             (auctex-latexmk-setup)

                             ))




(defun vz/latex-compile ()
  (interactive)
  (command-execute 'save-buffer)
  (command-execute 'TeX-command-master))

(defun vz/latex-beautify ()
  (interactive)
  (save-excursion
    (or (eq (point) (point-max)) (forward-char))
    (forward-sentence -1)
    (indent-relative t)
    (let ((beg (point))
          (ix (string-match "LaTeX" mode-name)))
      (forward-sentence)
      (if (and ix (equal "LaTeX" (substring mode-name ix)))
          (LaTeX-fill-region-as-paragraph beg (point))
        (fill-region-as-paragraph beg (point))))))
;;

(defun vz/latex-annote ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "annote")))

(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))

;;;
