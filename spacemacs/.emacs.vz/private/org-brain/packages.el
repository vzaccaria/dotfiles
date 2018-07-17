;; put this file in ~/.emacs.d/private/org-brain
;; then add org-brain into your dotspacemacs-configuration-layers in .spacemacs

(defconst org-brain-packages
  '(org-brain)
)

;; see https://github.com/Kungsgeten/org-brain#setup-and-requirements
(defun org-brain/init-org-brain ()
  (use-package org-brain
    :ensure t
    :init
    (with-eval-after-load 'evil
      (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
    (setq org-brain-path "~/Dropbox/org/org-brain")

  )
)
