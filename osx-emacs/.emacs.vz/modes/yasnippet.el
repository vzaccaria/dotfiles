(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs "~/.yasnippets/mysnippets")
(add-to-list 'yas-snippet-dirs "~/.yasnippets/yasnippet-snippets")
(yas-reload-all)
(add-to-list 'auto-mode-alist '("\\.yasnippet\\'" . snippet-mode))

;; fix autocompletion in c++ files
;; from https://github.com/capitaomorte/yasnippet/issues/311
(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
(defalias 'yas/table-hash 'yas--table-hash)
