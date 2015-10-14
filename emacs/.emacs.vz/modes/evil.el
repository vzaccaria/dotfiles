;; enable evil leader
(require 'evil)
(require 'evil-leader)

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)

(evil-mode 1)

;; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "SPC" 'bs-show
  "d" 'kill-this-buffer
  "q" 'kill-buffer-and-window
  )

;; Set the initial evil state that certain major modes will be in.
(evil-set-initial-state 'magit-log-edit-mode 'emacs)
(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)
(evil-set-initial-state 'bs-mode 'emacs)
