;;
;; Quick notes
;;
;; Intended for persistent but temporary notes.
;;

(add-to-list 'package-selected-packages 'denote)
(use-package denote
  :config
  (setq denote-directory (expand-file-name "~/Documents/notes/")))

(provide 'marek-notes)

