;;
;; Org-mode specific configuration.
;;

(require 'org)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(when (string-equal (system-name) "marek-linux")
  (setq org-directory "/media/veracrypt1/dokumenty/Notatki/private_notes/Todo/"))

(setq org-agenda-files (list (concat org-directory "Todo.org")))

;; allow to select text with shift
(setq org-support-shift-select t)

(provide 'marek-org-mode)
