(package-require 'haskell-snippets)
(package-require 'ghc)


(package-require 'company)
(package-require 'company-ghc)
(add-hook 'haskell-mode-hook 'company-mode)

(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))
