(load "~/.emacs.d/packages")
(load "~/.emacs.d/variables")

;;(with-eval-after-load 'mu4e
;;  (load "~/.emacs.d/mu4e"))
(let ((host (car (split-string (system-name) "\\."))))
  (when (string= host "MacBookPro")
    (load "~/.emacs.d/mu4e")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2b0fcc7cc9be4c09ec5c75405260a85e41691abb1ee28d29fcd5521e4fca575b"
     "a68ec832444ed19b83703c829e60222c9cfad7186b7aea5fd794b79be54146e6"
     default))
 '(package-selected-packages '(emacs-color-theme-solarized org-mime solarized-theme))
 '(package-vc-selected-packages
   '((emacs-color-theme-solarized :url
				  "https://github.com/sellout/emacs-color-theme-solarized.git"
				  :branch "master"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
