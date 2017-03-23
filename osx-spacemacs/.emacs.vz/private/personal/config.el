
(cond
 ((eq system-type 'darwin)

  (setenv "PATH" (format "%s:%s" "/usr/local/bin" (getenv "PATH")))
  (setenv "PATH" (format "%s:%s" "/usr/local/texlive/2013/bin/universal-darwin" (getenv "PATH")))
  (setenv "PATH" (format "%s:%s" "/Applications/Mathematica.app/Contents/MacOS" (getenv "PATH")))
  (setenv "PATH" (format "%s:%s" "/Users/zaccaria/.local/bin" (getenv "PATH")))
  (setenv "PATH" (format "%s:%s" "/root/.local/bin" (getenv "PATH")))
  (setenv "PATH" (format "%s:%s" "/Users/zaccaria/node_modules/.bin" (getenv "PATH")))
  (setenv "NODE_PATH" (format "%s:%s" "/usr/local/lib/node_modules" (getenv "NODE_PATH")))

  (setenv "DOCKER_TLS_VERIFY" "1")
  (setenv "DOCKER_HOST" "tcp://192.168.1.120:2376")
  (setenv "DOCKER_CERT_PATH" "/Users/zaccaria/dotfiles/zprezto/.zprezto-zack/Darwin/qnap-certs")

  (setq
   auto-completion-private-snippets-directory "~/dotfiles/osx-spacemacs/.emacs.vz/private/snippets"
   auto-completion-enable-help-tooltip t
   auto-completion-enable-sort-by-usage t))

 ((eq system-type 'gnu/linux)
    ;;; Linux specific conf
  )
 )
