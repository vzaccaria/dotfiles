;; languages: `protobuf'
(package-require 'protobuf-mode)
(eval-after-load 'flycheck
  '(package-require 'flycheck-protobuf))
(add-to-list 'flycheck-checkers 'protobuf-protoc-reporter t)
