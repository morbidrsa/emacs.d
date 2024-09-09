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
(setq whitespace-style
      '(face trailing tabs spaces lines lines-tail newline
	     missing-newline-at-eof
	     empty indentation space-after-tab space-before-tab space-mark
	     tab-mark newline-mark))
(defun my-whitespace-mode-hook () ""
       (set-face-attribute 'whitespace-space nil :background nil)
       (set-face-attribute 'whitespace-tab nil :background nil))
(add-hook 'whitespace-mode-hook 'my-whitespace-mode-hook)

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

