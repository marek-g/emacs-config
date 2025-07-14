;;
;; Quick notes
;;
;; Intended for persistent but temporary notes.
;;

;;
;; Configure denote
;;

(add-to-list 'package-selected-packages 'denote)
(use-package denote
  :config
  (setq denote-directory (cond
			  (ANDROID-P (expand-file-name "~/storage/Documents/Notatki/Temporary/"))
			  (t (expand-file-name "~/Documents/Temporary/"))
			  )))


;;
;; Add denote notes to the dashboard
;;

(require 'denote)
(require 'dashboard)

(defun my/dashboard-denote-notes (list-size)
  "Return a list of Denote note titles for the dashboard."
  (let ((files (denote-directory-files)))
    (mapcar (lambda (file)
              (list
               :title (denote-retrieve-filename-title file)
               :file  file))
            (dashboard-subseq (reverse files) list-size))))

(defun my/dashboard-insert-denote-widget (list-size)
  "Insert a widget showing recent Denote notes into the dashboard."
  (dashboard-insert-section
   "Denote Notes:"
   (my/dashboard-denote-notes list-size)
   list-size
   'notes
   "d" ;;(dashboard-get-shortcut 'notes)
   `(lambda (&rest _) (find-file (plist-get ',el :file)))
   (format "%s" (plist-get el :title))))

(add-to-list 'dashboard-item-generators '(denote . my/dashboard-insert-denote-widget))
(add-to-list 'dashboard-items '(denote . 5))

(provide 'marek-notes)

