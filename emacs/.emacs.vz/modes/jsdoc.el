(package-require 'js-doc)

(setq js-doc-mail-address "vittorio.zaccaria@gmail.com"
      js-doc-author (format "Vittorio Zaccaria <%s>" js-doc-mail-address)
      js-doc-url "www.vittoriozaccaria.net"
      js-doc-license "MIT")

(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))
