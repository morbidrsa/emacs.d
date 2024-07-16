(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(when (or (string= (system-name) "fedora")
	  (string= (system-name) "debian"))
  (package-install 'adwaita-dark-theme))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x C-g" . magit-status)))

(use-package ansible
  :ensure t)

(use-package minimap
  :ensure t
  :config (setq minimap-window-location 'right))

(use-package rust-mode
  :ensure t)

(use-package clang-format
  :ensure t
  :config (global-set-key [C-M-tab] 'clang-format-region))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (setq lsp-clangd-binary-path "/usr/bin/clangd")
  (setq lsp-client-clangd-args '("-j=4" "-background-index" "-log=error"))
  (setq lsp-keymap-prefix "C-c C-l"))
(use-package company
  :ensure t
  :config
  (add-hook 'c-mode-hook 'company-mode))

(use-package treemacs
  :ensure t)

(use-package treemacs-magit
  :ensure t)

(use-package lsp-treemacs
  :ensure t)

(require 'org)
