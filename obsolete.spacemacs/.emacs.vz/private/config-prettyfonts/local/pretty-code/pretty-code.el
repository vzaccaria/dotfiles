(defun my-correct-symbol-bounds (pretty-alist)
  "Prepend a TAB character to each symbol in this alist,
this way compose-region called by prettify-symbols-mode
will use the correct width of the symbols
instead of the width measured by char-width."
  (mapcar (lambda (el)
            (setcdr el (string ?\t (cdr el)))
            el)
          pretty-alist))

(defun my-ligature-list (ligatures codepoint-start)
  "Create an alist of strings to replace with
codepoints starting from codepoint-start."
  (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
    (-zip-pair ligatures codepoints)))

(setq my-code-ligatures
      (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                     "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                     "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                     "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                     ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                     "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
                     "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                     "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                     ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                     "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                     "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                     "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
                     "x" ":" "+" "+" "*")))
        (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

;; (obsolete..)
;; (setq my-hasklig-ligatures
;;       (let* ((ligs '("&&" "***" "*>" "\\\\" "||" "|>" "::"
;;                      "==" "===" "==>" "=>" "=<<" "!!" ">>"
;;                      ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
;;                      "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
;;                      "<<" "<<<" "<+>" ".." "..." "++" "+++"
;;                      "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->")))
;;         (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

;; nice glyphs for haskell with hasklig
(defun pretty-code-set-hasklig-ligatures ()
  "Add hasklig ligatures for use with prettify-symbols-mode."
  (setq prettify-symbols-alist
        (append my-code-ligatures prettify-symbols-alist))
  (prettify-symbols-mode))

(defun pretty-code-set-fira-code-ligatures ()
  "Add fira-code ligatures for use with prettify-symbols-mode."
  (setq prettify-symbols-alist
        (append my-code-ligatures prettify-symbols-alist))
  (prettify-symbols-mode))


(defun pretty-code-init-haskell-mode-prettification ()
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
          )))


(defun pretty-code-init-latex-mode-prettification ()
  (interactive)
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
  )




(provide 'pretty-code)
