(require 'haskell-snippets)
(custom-set-variables
 '(safe-local-variable-values
   (quote
    ((flycheck-disabled-checkers quote (haskell-stack-ghc))
     ))))
(eval-after-load 'flycheck '(require 'flycheck-ghcmod))
