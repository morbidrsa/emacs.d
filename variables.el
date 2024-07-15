(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq column-number-mode 1)
(setq make-backup-files nil)

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :height 120 :foundry "nil" :family "Menlo")
  )

(when (or (string= (system-name) "fedora")
	  (string= (system-name) "debian"))
  (load-theme 'adwaita-dark))


(defun my-prog-mode-hook () ""
       (whitespace-mode)
       (display-line-numbers-mode))
(add-hook 'prog-mode-hook 'my-prog-mode-hook)
