;; CHECK THIS FOR TERN: https://simpletutorials.com/c/2799/How%20to%20resolve%20%26quot%3BUndeclared%20variable%20or%20function%20%26%23x27%3Bmodule%26%23x27%3B%26quot%3B%20error%20thrown%20by%20Tern%20in%20Spacemacs


(setq config-javascript-packages
      '(
        (prettier-js :location local)
        js2-mode
        flycheck
        ))

(defun config-javascript/init-prettier-js ()
  (use-package prettier-js
    :config

    (add-hook 'js-mode-hook
              (lambda ()
                (add-hook 'before-save-hook 'prettier-before-save)))

    (add-hook 'js2-mode-hook
              (lambda ()
                (add-hook 'before-save-hook 'prettier-before-save)))

    (add-hook 'react-mode-hook
              (lambda ()
                (add-hook 'before-save-hook 'prettier-before-save)))
    )
  )



(defun config-javascript/post-init-flycheck ()
  (add-hook 'js-mode-hook '(lambda ()
                             (flycheck-select-checker 'javascript-eslint)
                             ))

  (add-hook 'js2-mode-hook '(lambda ()
                              (flycheck-select-checker 'javascript-eslint)
                              ))
  )


