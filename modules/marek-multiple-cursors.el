(add-to-list 'package-selected-packages 'multiple-cursors)
(add-to-list 'package-selected-packages 'multiple-cursors-core)
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines) ;; turn a selection into multiple cursors, one per line
         ("C->"         . mc/mark-next-like-this) ;; add cursors for next matching text
         ("C-<"         . mc/mark-previous-like-this) ;; add cursors for previous matching text
         ("C-c C-<"     . mc/mark-all-like-this))) ;; mark all matches in the buffer

;; let <return> insert <return> in multiple-cursors mode
(use-package multiple-cursors-core
    :bind
   (:map mc/keymap
         ("<return>" . nil)))

(provide 'marek-multiple-cursors)
