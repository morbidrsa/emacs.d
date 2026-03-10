(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))


(use-package ox-pandoc
  :ensure t)

(global-set-key (kbd "C-x a") #'org-agenda)

(defun jth/show-todays-agenda ()
    "Show today's org-agenda."
    (org-agenda nil "a"))

(when (file-exists-p "~/Notes/agenda.org")
  (add-to-list 'org-agenda-files "~/Notes/agenda.org")
  (add-hook 'emacs-startup-hook #'jth/show-todays-agenda))

(when (file-exists-p "~/Notes/private.org")
  (add-to-list 'org-agenda-files "~/Notes/private.org")
  (add-hook 'emacs-startup-hook #'jth/show-todays-agenda))
