(setq comment-style 'extra-line)

(add-hook 'js2-mode-hook
          (lambda ()
            (setq-local commenter-config
                        '((single
                           . ((comment-start      . "//")
                              (comment-end        . "")
                              (comment-start-skip . "\\(//+\\|/\\*+\\)\\s *")))
                          (multi
                           . ((comment-start      . "/* ")
                              (comment-end        . " */")
                              (comment-start-skip . "/\\*")
                              (comment-end-skip   . "\\*/")
                              (comment-continue   . " * ")
                              (comment-padding    . " ")
                              (comment-multi-line . t)))))

            (commenter-setup)))
