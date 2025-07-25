;;
;; Org-mode specific configuration.
;;

(require 'org)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(when HOME-LINUX-P
  (setq org-directory "~/Ext/dokumenty/Notatki/private_notes/Todo/"))

;;(setq org-agenda-files (list (concat org-directory "Todo.org")))

;; TODO keywords
(setq org-todo-keywords '((sequence "TODO" "BLOCKED" "INPROGRESS" "REVIEW" "DONE")))

;; allow to select text with shift
(setq org-support-shift-select t)

;; Make the indentation look nicer
(setq org-startup-indented t)

;; Show inline images
(setq org-startup-with-inline-images t)
(setq org-image-actual-width (list 750))

;; Hide the markers so you just see bold text as BOLD-TEXT and not *BOLD-TEXT*
(setq org-hide-emphasis-markers t)

(provide 'marek-org-mode)
