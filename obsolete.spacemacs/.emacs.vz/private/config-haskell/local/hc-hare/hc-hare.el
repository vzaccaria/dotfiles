(add-to-load-path "/home/admin/.stack/snapshots/x86_64-linux/lts-6.7/7.10.3/share/x86_64-linux-ghc-7.10.3/HaRe-0.8.2.3/elisp/")

(require 'hare)

(autoload 'hare-init "hare" nil t)
(spacemacs/declare-prefix-for-mode 'haskell-mode "me" "haskell/hare-refactor")

(provide 'hc-hare)
