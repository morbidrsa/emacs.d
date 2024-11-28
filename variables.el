(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)

(setq column-number-mode 1)
(setq make-backup-files nil)

(setq show-trailing-whitespace t)

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :height 120 :foundry "nil" :family "Menlo")
  )

(setq verilog-auto-endcomments nil)
(setq whitespace-style
      '(face trailing tabs spaces lines lines-tail newline
	     missing-newline-at-eof
	     empty indentation space-after-tab space-before-tab space-mark
	     tab-mark newline-mark))
(defun my-whitespace-hook () ""
       (set-face-attribute 'whitespace-space nil :background nil)
       (set-face-attribute 'whitespace-tab nil :background nil))
(add-hook 'whitespace-hook 'my-whitespace-hook)

(add-hook 'c-mode-hook 'lsp)

(defun my-prog-mode-hook () ""
       (when (display-graphic-p)
	 (whitespace-mode))
       (display-line-numbers-mode)
       (setq-default fill-column 80)
       (setq display-fill-column-indicator-column t)
       (set-face-foreground 'fill-column-indicator "red")
       (display-fill-column-indicator-mode)
       (global-display-fill-column-indicator-mode)
       )
(add-hook 'prog-mode-hook 'my-prog-mode-hook)

(defun lsp-mode-config-hook () ""
       (unless (display-graphic-p)
         (set-face-attribute 'lsp-headerline-breadcrumb-path-face nil
                             :foreground "black")
         (set-face-attribute 'lsp-headerline-breadcrumb-symbols-face nil
                             :foreground "black" :underline nil
                             :weight 'normal)))

(add-hook 'lsp-after-open-hook 'lsp-mode-config-hook)

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

