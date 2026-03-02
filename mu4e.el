(use-package mu4e
  :load-path  "/usr/local/Cellar/mu/1.12.15/share/emacs/site-lisp/mu/mu4e/")


;; SMTP
(require 'smtpmail)

;; MU
(setq mu4e-mu-binary (executable-find "mu"))

(global-set-key "\M-m" 'mu4e)

(setq mu4e-maildir "~/.mailbox")

;; MBSYNC
(setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
(setq mu4e-change-filenames-when-moving t)
;; MBSYNC interval in seconds
(setq mu4e-update-interval 300)

(setq mu4e-attachment-dir "~/.mailbox/MailAttachments")

(setq mu4e-user-mail-address-list '("morbidrsa@gmail.com"))

(setq   mu4e-maildir-shortcuts
        '(("/GMail/INBOX" . ?a)
          ))

;; CONTEXTS ======= change these, including mailbox subfolder names per your mailboxes =======
(setq mu4e-contexts
      `(,(make-mu4e-context
          :name "foo"
          :enter-func
          (lambda () (mu4e-message "Opening foo@bar.tld"))
          :leave-func
          (lambda () (mu4e-message "Closing morbidrsa@gmail.com"))
          :match-func
          (lambda (msg)
            (when msg
              (mu4e-message-contact-field-matches msg
                                                  :to "morbidrsa@gmail.com")))
          :vars '((user-mail-address . "morbidrsa@gmail.com" )
                  (user-full-name . "Johannes Thumshirn")
                  (mu4e-drafts-folder . "/gmail/Drafts")
                  (mu4e-refile-folder . "/gmail/Archive")
                  (mu4e-sent-folder . "/gmail/Sent Messages")
                  (mu4e-trash-folder . "/gmail/Deleted Messages")))

	))

;; ENCRYPTION
(require 'epa-file)
;; Uncomment below if you do not have EPA already in your init ======= change this =======
;; (epa-file-enable)
(setq epa-pinentry-mode 'loopback)
(auth-source-forget-all-cached)

;; AUTO-COMPLETE (Run M-x RET company RET once) ======= install company =======
;; This is optional, so delete the lines below if you would rather not have auto-complete
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'mu4e-compose-mode-hook 'company-mode)

;; SENDING
(setq send-mail-function 'message-send-mail-with-sendmail
      message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program (executable-find "msmtp"))
(setq message-sendmail-envelope-from 'header)

;; POLICIES
(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy 'ask)
(setq message-kill-buffer-on-exit t)
(setq mu4e-hide-index-messages t)
(setq org-mu4e-link-query-in-headers-mode nil)
(setq mu4e-headers-visible-lines 25)
(setq mu4e-view-show-addresses t)
(setq mu4e-headers-include-related nil)
(setq mu4e-headers-show-threads t)
(setq message-citation-line-function 'message-insert-formatted-citation-line)
(setq message-citation-line-format "%N @ %Y-%m-%d %H:%M :\n")
