;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.


(defun dotspacemacs/layers ()
  "Spacemacs layers declarations and package configurations."
  (dotspacemacs/layers/config)
  (dotspacemacs/layers/packages))

(defun dotspacemacs/layers/config ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t

   dotspacemacs-configuration-layer-path '("~/.emacs.vz/private/")
   dotspacemacs-configuration-layers (append dotspacemacs/layers/core
                                             dotspacemacs/layers/langs
                                             dotspacemacs/layers/extra
                                             dotspacemacs/layers/local)
   )
  (if vz/is-darwin
      (setq-default dotspacemacs-configuration-layers
                    (append dotspacemacs-configuration-layers dotspacemacs/layers/osx)))
  )


(defun dotspacemacs/layers/packages ()
  (setq-default
   dotspacemacs-additional-packages '(
                                      solarized-theme
                                      nord-theme
                                      helm-projectile
                                      )
   dotspacemacs-excluded-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-install-packages 'used-but-keep-unused
   ))

(defvar dotspacemacs/layers/core
  '(better-defaults
    git
    syntax-checking
    helm
    shell-scripts
    (auto-completion :variables
                     auto-completion-return-key-behavior 'complete
                     auto-completion-tab-key-behavior 'cycle
                     auto-completion-complete-with-key-sequence nil
                     auto-completion-complete-with-key-sequence-delay 0.1
                     auto-completion-enable-snippets-in-popup t
                     auto-completion-enable-help-tooltip t
                     auto-completion-enable-sort-by-usage t
                     auto-completion-private-snippets-directory "~/dotfiles/spacemacs/.emacs.vz/private/snippets"
                     spacemacs-default-company-backends '(company-files company-yasnippet)
                     )
    (org :variables org-enable-reveal-js-support t)
    (shell :variables
           shell-default-shell 'eshell)
    (version-control :variables
                     version-control-global-margin t
                     version-control-diff-tool 'git-gutter+)
    )
  "Layers I consider core to Spacemacs. Loaded for all OSes")

(defvar dotspacemacs/layers/osx
  '(
    (bibtex)
    (nixos)
    )
  "Layers I consider core to Spacemacs. Loaded for all OSes")

(defvar dotspacemacs/layers/langs
  '(
    javascript
    react
    python
    octave
    emacs-lisp
    vimscript
    haskell
    (c-c++ :variables c-c++-enable-clang-support t)

    yaml
    csv
    html
    markdown

    spell-checking

    (latex :variables
           latex-enable-auto-fill t
           latex-enable-folding t)
    )
  )

(defvar dotspacemacs/layers/extra
  '(gnus
    graphviz
    ranger
    (ibuffer :variables
             ibuffer-group-buffers-by 'projects)
    docker
    finance
    deft
    prodigy
    command-log
    typography
    osx
    )
  "Miscellaneous layers")

(defvar dotspacemacs/layers/local
  '(
    (macros :location local)
    (config :location local)
    (display :location local) ; Pretty-eshell/code/outlines... pkgs
    ;; (langs :location local)     ; Language config
    (personal :location local
              :variables
              personal-bind-osx-keys (if vz/is-linux nil t)
              personal-bind-unix-keys (if vz/is-linux t nil))
    (maxima :variables
            maxima-emacs-installation-path
            "/opt/homebrew-cask/Caskroom/sage/6.9/Sage-6.9.app/Contents/Resources/sage/local/share/maxima/5.35.1/emacs"
            maxima-emacs-info-path
            "/opt/homebrew-cask/Caskroom/sage/6.9/Sage-6.9.app/Contents/Resources/sage/local/share/info" )
    )
  "Local layers housed in '~/.emacs.vz/private'.")


(defun dotspacemacs/init ()
  "Spacemacs core settings."
  (dotspacemacs/init/coding)
  (dotspacemacs/init/display)
  (dotspacemacs/init/evil)
  (dotspacemacs/init/keys)
  (dotspacemacs/init/layouts)
  (dotspacemacs/init/misc)
  (dotspacemacs/init/packages)
  (dotspacemacs/init/startup))

(defun dotspacemacs/init/coding ()
  (setq-default
   dotspacemacs-search-tools '("ag" "rg" "pt" "ack" "grep")
   dotspacemacs-smooth-scrolling t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-line-numbers nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/init/display ()
  (setq-default
   dotspacemacs-themes '(
                         spacemacs-light
                         zenburn
                         nord
                         solarized-light
                         solarized-dark
                         )
   dotspacemacs-default-font '("Hasklig"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   ))

(defun dotspacemacs/init/evil ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   ))

(defun dotspacemacs/init/keys ()
  (setq-default
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-which-key-delay 0.2
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   ))

(defun dotspacemacs/init/layouts ()
  (setq-default
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names t
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ))

(defun dotspacemacs/init/misc ()
  (setq-default
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-persistent-server nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-use-ido nil
   dotspacemacs-enable-paste-micro-state nil
   ))

;;;; Packages

(defun dotspacemacs/init/packages ()
  (setq-default
   dotspacemacs-default-package-repository nil
   dotspacemacs-elpa-https nil
   dotspacemacs-elpa-timeout 30
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   ))

;;;; Startup

(defun dotspacemacs/init/startup ()
  (setq-default
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-loading-progress-bar t
   )
  (defconst vz/hostname
    (string-trim (with-output-to-string
                   (call-process "hostname" nil standard-output nil))))
  (defconst vz/is-darwin (eq system-type 'darwin))
  (defconst vz/is-linux (eq system-type 'gnu/linux))
  (defconst vz/is-home-mac (string-equal vz/hostname "macbook.local"))
  (defconst vz/is-work-mac (string-equal vz/hostname "Vittorios-MacBook-Pro.local"))
  )


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (cond
   ((eq system-type 'darwin)
    (setq org-enable-reveal-js-support t)
    (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
    (setq tramp-ssh-controlmaster-options
          "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"))
   ))

  (defun dotspacemacs/user-config ()
    "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."

  ;;; remove from the article class the default packages
    (add-to-list 'auto-mode-alist '("\\.html" . html-mode))

    (setq org-latex-minted-options
          '(("obeytabs" "true")
            ("baselinestretch" "0.95")
            ;;("frame" "lines")
            ;; ("frame" "single")
            ;; ("framesep" "10pt")
            ("bgcolor" "bgl")
            ("linenos=true")
            ))

    (setq org-latex-listings 'minted)

    (setq org-latex-pdf-process
          '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

    (cond
     ((eq system-type 'darwin)
      (setq backup-directory-alist
            `((".*" . , "~/emacs-backup-dir")))
      (setq auto-save-file-name-transforms
            `((".*" , "~/emacs-backup-dir" t)))
      (setq browse-url-mailto-function 'browse-url-generic)
      (setq browse-url-generic-program "open")
      ;; On Darwin set up Fira Code Symbol ligatures..


      ;; This works when using emacs --daemon + emacsclient
      (find-file "~/Dropbox/org/dashboard.org")
      ;; setup latex correlation
      (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
      (setq TeX-source-correlate-mode t)
      (setq TeX-source-correlate-start-server t)
      (setq TeX-source-correlate-method 'synctex)
      (setq TeX-view-program-list
            '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
      (vz/enable-latex-esc-before-save))
     ((eq system-type 'gnu/linux)
      (setq TeX-view-program-selection '((output-pdf "Zathura")))
      (setq TeX-source-correlate-mode t)
      (setq TeX-source-correlate-start-server t)
      (setq TeX-source-correlate-method 'synctex)
      )
     )



    (add-hook 'before-save-hook 'prettier-before-save)
    (add-hook 'before-save-hook 'beautify-haskell-before-save)

    (customize-set-variable 'helm-ag-base-command "ag --nocolor --nogroup --hidden")

    ;; latex ftw
    ;; (add-to-list 'auto-mode-alist '("\\.tex" . latex-mode))
    (setq TeX-parse-self t); Enable parse on load.
    (setq TeX-auto-save t); Enable parse on save.
    (setq-default TeX-master nil)
    (setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

    ;; Reftex config
    ;;
    ;; Remember if you write: ‘As we have shown in Theorem’ and then press C-c ),
    ;; RefTeX will know that you are looking for a theorem label and restrict the
    ;; menu to only these labels without even asking
    ;;
    ;; https://www.gnu.org/software/emacs/manual/html_node/reftex/Theorem-and-Axiom.html
    (setq reftex-label-alist
          '(("corollary"   ?a "co:"  "~\\ref{%s}" nil ("corollary"   "cor.") -2)
            ("theorem" ?h "th:" "~\\ref{%s}" t   ("theorem" "th.") -3)))

    (setq reftex-plug-into-AUCTeX t)
    (setq reftex-ref-macro-prompt nil)


    ;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
    ;; (add-hook 'TeX-mode-hook 'LaTeX-math-mode)

    ;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
    ;; (add-hook 'TeX-mode-hook 'turn-on-reftex)
    )

  ;; Move some of the variables defined below into user-config
  ;; as soon as you understand what variables do...

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (spacemacs-light)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(disaster-cc "clang")
 '(disaster-objdump "gobjdump -d -M att -Sl --no-show-raw-insn")
 '(evil-want-Y-yank-to-eol t)
 '(evilnc-default-hotkeys t)
 '(fci-rule-color "#eee8d5" t)
 '(flycheck-python-pycompile-executable
   "/Applications/Blender.app/Contents/MacOS/../Resources/2.78/python/bin/python3.5m")
 '(helm-ag-base-command "ag --nocolor --nogroup --hidden" t)
 '(helm-ag-use-agignore t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(ledger-reports
   (quote
    (("FRA" "ledger -f /Users/zaccaria/Dropbox/org/institutional/administration/finance/fondi.ledger reg Assets\\:Fondi\\:Ateneo\\:Fondo\\ Ricerca\\ Ateneo")
     ("STMicroelectronics" "ledger -f /Users/zaccaria/Dropbox/org/institutional/administration/finance/fondi.ledger reg Assets\\:Fondi\\:STMicroelectronics")
     ("fondi esercitazioni" "ledger -f /Users/zaccaria/Dropbox/org/institutional/administration/finance/fondi.ledger reg Assets\\:Fondi\\:Ateneo\\:Esercitazioni")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
 '(magit-diff-use-overlays nil)
 '(magit-log-section-arguments (quote ("--decorate" "-n256")))
 '(markdown-command "/usr/local/bin/pandoc")
 '(mlint-programs
   (quote
    ("mlint" "mac/mlint" "/Applications/MATLAB_R2015b.app/bin/maci64/mlint")))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-prefix-format
   (quote
    ((agenda . " %i %-12:c%?-12t% s")
     (timeline . "  % s")
     (todo . " %i  %-20:c %-25:b")
     (tags . " %i %-12:c")
     (search . " %i %-12:c"))))
 '(org-html-inline-image-rules
   (quote
    (("file" . "\\.\\(jpeg\\|jpg\\|png\\|pdf\\|gif\\|svg\\)\\'")
     ("http" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'")
     ("https" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'"))))
 '(package-selected-packages
   (quote
    (nix-mode helm-nixos-options company-nixos-options nixos-options org-ref pdf-tools key-chord helm-bibtex parsebib biblio biblio-core wgrep unfill smex ranger org-category-capture nord-theme mwim ivy-hydra ibuffer-projectile graphviz-dot-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-ivy diff-hl counsel-projectile counsel swiper ivy define-word powerline spinner alert log4e gntp markdown-mode skewer-mode simple-httpd multiple-cursors js2-mode hydra parent-mode projectile haml-mode flyspell-correct flycheck pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight json-mode tablist docker-tramp json-snatcher json-reformat diminish web-completion-data dash-functional tern pos-tip ghc haskell-mode company bind-map bind-key yasnippet packed auctex anaconda-mode pythonic f s helm avy helm-core auto-complete popup wolfram-mode thrift stan-mode scad-mode qml-mode matlab-mode arduino-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor dash async winum fuzzy monokai-theme writeroom-mode visual-fill-column ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode pretty-mode highlight-chars yapfify yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package typo toc-org tagedit spacemacs-theme spaceline solarized-theme slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs request rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode prodigy popwin pip-requirements persp-mode pcre2el pbcopy paradox ox-reveal osx-trash osx-dictionary org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc macrostep lorem-ipsum livid-mode livescript-mode live-py-mode linum-relative link-hint less-css-mode ledger-mode launchctl js2-refactor js-doc intero insert-shebang info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gnuplot gh-md flyspell-correct-helm flycheck-pos-tip flycheck-ledger flycheck-haskell flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-multiedit evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dockerfile-mode docker disaster deft dactyl-mode cython-mode csv-mode company-web company-tern company-statistics company-shell company-quickhelp company-ghci company-ghc company-cabal company-c-headers company-auctex company-anaconda command-log-mode column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(prettier-target-mode "js2-mode")
 '(safe-local-variable-values (quote ((TeX-command-extra-options . "-shell-escape"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F" :family "Hasklig" :foundry "nil" :slant normal :weight normal :height 160 :width normal))))
;;  '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
;;  '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
