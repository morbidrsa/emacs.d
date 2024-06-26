(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

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
  :config
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-clangd-binary-path "/usr/bin/clangd")
  (setq lsp-client-clangd-args '("-j=4" "-background-index" "-log=error"))
  (setq lsp-keymap-prefix "C-c C-l"))

(require 'org)
