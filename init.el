(load "~/.emacs.d/packages")
(load "~/.emacs.d/variables")
(when (file-exists-p "~/.emacs.d/org.el")
  (load "~/.emacs.d/org"))

(when (file-exists-p "~/.emacs.d/themes.el")
  (load-file "~/.emacs.d/themes.el"))

(if (eq system-type 'darwin)
    (load "~/.emacs.d/macos"))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(let ((host (car (split-string (system-name) "\\."))))
  (when (string= host "MacBookPro")
    (load "~/.emacs.d/mu4e")))
