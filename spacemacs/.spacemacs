;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.vz/private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.

   vz--layers
   '(
     ;; editing
     markdown
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
     spell-checking
     (latex :variables
            latex-enable-auto-fill t
            latex-enable-folding t)

     ;; productivity
     docker
     (org :variables org-enable-reveal-js-support t)
     finance
     deft
     prodigy
     command-log
     shell
     shell-scripts
     typography
     git

     ;; generic data formats
     yaml
     csv

     ;; programming languages
     syntax-checking
     javascript
     react
     python
     octave
     emacs-lisp
     vimscript
     haskell
     ess
     )
   )

  (setq
   vz--darwin-layers
   '(
     (personal :variables
               personal-bind-osx-keys t
               personal-bind-unix-keys nil)
     osx
     (maxima :variables
             maxima-emacs-installation-path "/opt/homebrew-cask/Caskroom/sage/6.9/Sage-6.9.app/Contents/Resources/sage/local/share/maxima/5.35.1/emacs"
             maxima-emacs-info-path "/opt/homebrew-cask/Caskroom/sage/6.9/Sage-6.9.app/Contents/Resources/sage/local/share/info" )
     (c-c++ :variables c-c++-enable-clang-support t)
     extra-langs
     )

   vz--gnu/linux-layers
   '(
     (personal :variables
               personal-bind-unix-keys t
               personal-bind-osx-keys nil)
     )
   )

  (cond
   ((eq system-type 'darwin)
    (setq vz--layers (append vz--layers vz--darwin-layers)))
   ((eq system-type 'gnu/linux)
    (setq vz--layers (append vz--layers vz--gnu/linux-layers))))

  (setq-default
   dotspacemacs-configuration-layers vz--layers
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t)
  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update nil
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         solarized-dark
                         leuven
                         spacemacs-light
                         solarized-light
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.2)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (cond
   ((eq system-type 'darwin)
    ;;; Darwin specific conf
    (setq deft-directory "~/Dropbox/org")
    (setq deft-recursive t)
    ;; I need some programs from these locations:
    (eval-after-load "flycheck"

      ;; Flycheck configuration

      '(progn
         (flycheck-define-checker grammar-gramcheck
                                  "A general purpose grammar checker. It uses LanguageTool."

                                  :command ("gramchk" "check" source-original)
                                  :error-parser flycheck-parse-checkstyle
                                  :standard-input t
                                  :modes (latex-mode plain-TeX-mode)
                                  :next-checkers 'tex-lacheck)


         (flycheck-define-checker proselint
                                  "A linter for prose."
                                  :command ("proselint" source-inplace)
                                  :error-patterns
                                  ((warning line-start (file-name) ":" line ":" column ": "
                                            (id (one-or-more (not (any " "))))
                                            (message (one-or-more not-newline)
                                                     (zero-or-more "\n" (any " ") (one-or-more not-newline)))
                                            line-end))
                                  :modes (latex-mode text-mode markdown-mode gfm-mode)
                                  :next-checkers 'tex-lacheck)

         ;; These go into the list of checkers that can be used in every buffer (according to major-mode)
         (add-to-list 'flycheck-checkers 'proselint)
         (add-to-list 'flycheck-checkers 'grammar-gramcheck)

         (add-hook 'plain-TeX-mode-hook 'flycheck-mode)
         (add-hook 'LaTeX-mode-hook 'flycheck-mode)
         (add-hook 'js-mode-hook 'flycheck-mode)
         (add-hook 'shell-mode (lambda () (interactive)
                                 flycheck-select-checker 'sh-shellcheck))
         )
      )
    (setq org-enable-reveal-js-support t)
    (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
    (setq tramp-ssh-controlmaster-options
          "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"))
   ((eq system-type 'gnu/linux)
    ;;; Linux specific conf
    (setq deft-directory "~/Dropbox/org")
    (setq deft-recursive t)
    (add-hook 'js2-mode-hook (lambda () (interactive)
                               (vz/add-node-modules-path)
                              ))
    (add-hook 'shell-mode (lambda () (interactive)
                            flycheck-select-checker 'sh-shellcheck))
    ))



  )

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
          ;; ("frame" "lines")
          ;; ("linenos=true")
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
    ;;; Fira code
    ;; This works when using emacs --daemon + emacsclient
    (find-file "~/Dropbox/org/dashboard.org")
    ;; setup latex correlation
    (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
    (setq TeX-source-correlate-mode t)
    (setq TeX-source-correlate-start-server t)
    (setq TeX-source-correlate-method 'synctex)
    (setq TeX-view-program-list
          '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
    (vz/enable-latex-esc-before-save)
    )
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
 '(helm-ag-base-command "ag --nocolor --nogroup --hidden")
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
 '(magit-diff-use-overlays nil)
 '(magit-log-section-arguments (quote ("--decorate" "-n256")))
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
    (powerline spinner alert log4e gntp markdown-mode skewer-mode simple-httpd multiple-cursors js2-mode hydra parent-mode projectile haml-mode flyspell-correct flycheck pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight json-mode tablist docker-tramp json-snatcher json-reformat diminish web-completion-data dash-functional tern pos-tip ghc haskell-mode company bind-map bind-key yasnippet packed auctex anaconda-mode pythonic f s helm avy helm-core auto-complete popup wolfram-mode thrift stan-mode scad-mode qml-mode matlab-mode arduino-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor dash async winum fuzzy monokai-theme writeroom-mode visual-fill-column ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode pretty-mode highlight-chars yapfify yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package typo toc-org tagedit spacemacs-theme spaceline solarized-theme slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs request rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode prodigy popwin pip-requirements persp-mode pcre2el pbcopy paradox ox-reveal osx-trash osx-dictionary org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc macrostep lorem-ipsum livid-mode livescript-mode live-py-mode linum-relative link-hint less-css-mode ledger-mode launchctl js2-refactor js-doc intero insert-shebang info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gnuplot gh-md flyspell-correct-helm flycheck-pos-tip flycheck-ledger flycheck-haskell flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-multiedit evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dockerfile-mode docker disaster deft dactyl-mode cython-mode csv-mode company-web company-tern company-statistics company-shell company-quickhelp company-ghci company-ghc company-cabal company-c-headers company-auctex company-anaconda command-log-mode column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(prettier-target-mode "js2-mode")
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
