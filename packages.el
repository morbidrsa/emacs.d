(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)


(if (or (string= (system-name) "fedora")
	(string= (system-name) "debian"))
  (use-package adwaita-dark-theme
    :ensure t
    :config
    (load-theme 'adwaita-dark t))
  (use-package vscode-dark-plus-theme
    :ensure t
    :config
    (load-theme 'vscode-dark-plus t)))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x C-g" . magit-status)))

(use-package flycheck
  :ensure t
  :defer t)

(use-package ansible
  :ensure t
  :defer t)

(use-package minimap
  :ensure t
  :defer t
  :config (setq minimap-window-location 'right))

(use-package whitespace
  :ensure t
  :defer t
  :config
  (set-face-attribute 'whitespace-space nil :background nil)
  (set-face-attribute 'whitespace-tab nil :background nil)
  )

(use-package rust-mode
  :ensure t
  :defer t)

(use-package clang-format
  :ensure t
  :defer t
  :config (global-set-key [C-M-tab] 'clang-format-region))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
    (c-mode-hook . lsp)
    (c++-mode-hook . lsp)
    (python-mode-hook . lsp)
  :config
  (setq lsp-clangd-binary-path "/usr/bin/clangd")
  (setq lsp-client-clangd-args '("-j=4" "-background-index" "-log=error"))
  (setq lsp-keymap-prefix "C-c C-l"))

(use-package company
  :ensure t
  :defer t
  :config
  (add-hook 'c-mode-hook 'company-mode))

(use-package treemacs
  :ensure t
  :defer t)

(use-package treemacs-magit
  :ensure t
  :defer t)

(use-package lsp-treemacs
  :ensure t
  :defer t)

(use-package lsp-ui
  :ensure t
  :defer t)

(use-package vterm
  :ensure t
  :defer t
  :bind (:map vterm-mode-map ("C-y" . vterm-yank))
    :config (setq vterm-max-scrollback 100000))

(require 'org)
