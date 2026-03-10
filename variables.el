(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)

(setq column-number-mode 1)
(setq make-backup-files nil)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; from https://github.com/SophieBosio/.emacs.d/blob/main/init.org#custom-mode-line
(setq-default mode-line-format
      '("%e"
	(:propertize " " display (raise +0.4)) ;; Top padding
	(:propertize " " display (raise -0.4)) ;; Bottom padding

	(:propertize "λ " face font-lock-comment-face)
	mode-line-frame-identification
	mode-line-buffer-identification

	;; Version control info
	(:eval (when-let (vc vc-mode)
		 ;; Use a pretty branch symbol in front of the branch name
		 (list (propertize "   " 'face 'font-lock-comment-face)
		       ;; Truncate branch name to 50 characters
		       (propertize (truncate-string-to-width
				    (substring vc 5) 50)
				   'face 'font-lock-comment-face))))

	;; Add space to align to the right
	(:eval (propertize
		" " 'display
		`((space :align-to
			 (-  (+ right right-fringe right-margin)
			     ,(+ 3
				 (string-width (or lsp-modeline--code-actions-string ""))
				 (string-width "%4l:3%c")))))))

	;; LSP code actions
	(:eval (or lsp-modeline--code-actions-string ""))

	;; Line and column numbers
	(:propertize "%4l:%c" face mode-line-buffer-id)))


(setq-default show-trailing-whitespace t)

(setq verilog-auto-endcomments nil)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'rust-mode-hook 'lsp)

(defun my-prog-mode-hook () ""
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
