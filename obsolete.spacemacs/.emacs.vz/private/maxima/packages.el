;;; packages.el --- personal layer packages file for Spacemacs.
;;; for info: https://www.emacswiki.org/emacs/MaximaMode

(defconst maxima-packages
  '(
    (imaxima :location local)
    (maxima :location local)
    )
  )


(defun maxima/init-imaxima()
  (use-package imaxima
    :mode ("\\.ma[cx]" . maxima-mode)

    :init
      (progn
        (add-to-list 'load-path maxima-emacs-installation-path)
        (autoload 'maxima-mode "maxima" "Maxima mode" t)
        (autoload 'maxima "maxima" "Maxima interaction" t)
        (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
        (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
        (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))
        (add-to-list 'Info-additional-directory-list maxima-emacs-info-path)
        (setq imaxima-use-maxima-mode-flag t)
        (setq imaxima-scale-factor 2.0)

        (add-hook 'maxima-mode-hook '(lambda ()
              (spacemacs/declare-prefix-for-mode        'maxima-mode "m" "maxima")
              (spacemacs/declare-prefix-for-mode        'maxima-mode "mh" "maxima/help")
              (spacemacs/set-leader-keys-for-major-mode 'maxima-mode
                 "hh" 'maxima-help
              )))
        )

    :config
    (progn
        (setq maxima-command "sage")
        (setq maxima-args  '("-maxima"))
        ))) 



(defun maxima/init-maxima()
  (use-package maxima
    :mode ("\\.ma[cx]" . maxima-mode)

    :init
      (progn
        (add-to-list 'load-path maxima-emacs-installation-path)
        (autoload 'maxima-mode "maxima" "Maxima mode" t)
        (autoload 'maxima "maxima" "Maxima interaction" t)
        (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
        (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
        (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))
        (add-to-list 'Info-additional-directory-list maxima-emacs-info-path)
        (setq imaxima-use-maxima-mode-flag t)
        (setq imaxima-scale-factor 2.0)

        (add-hook 'maxima-mode-hook '(lambda ()
              (spacemacs/declare-prefix-for-mode        'maxima-mode "m" "maxima")
              (spacemacs/declare-prefix-for-mode        'maxima-mode "mh" "maxima/help")
              (spacemacs/set-leader-keys-for-major-mode 'maxima-mode
                 "hh" 'maxima-help
              )))
        )

    :config
    (progn
        (setq maxima-command (if vz/is-linux-station "maxima" "sage"))
        (setq maxima-args  (if vz/is-linux-station '() '("-maxima")))
        ))) 

