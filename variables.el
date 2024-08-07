(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq column-number-mode 1)
(setq make-backup-files nil)

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :height 120 :foundry "nil" :family "Menlo")
  )

(setq verilog-auto-endcomments nil)
(setq whitespace-mode
    (quote (spaces tabs newline space-mark stab-mark newline-mark)))

(defun my-prog-mode-hook () ""
       (whitespace-mode)
       (display-line-numbers-mode))
(add-hook 'prog-mode-hook 'my-prog-mode-hook)

(add-to-list 'display-buffer-alist
     '("\*vterm\*"
       (display-buffer-in-side-window)
       (window-height . 0.25)
       (side . bottom)
       (slot . 0)))

(add-to-list 'display-buffer-alist
     '("\*compilation\*"
       (display-buffer-in-side-window)
       (window-height . 0.25)
       (side . bottom)
       (slot . 0)))

