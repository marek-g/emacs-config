(add-to-list 'package-selected-packages 'multiple-cursors)
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines) ;; turn a selection into multiple cursors, one per line
         ("C->"         . mc/mark-next-like-this) ;; add cursors for next matching text
         ("C-<"         . mc/mark-previous-like-this) ;; add cursors for previous matching text
         ("C-c C-<"     . mc/mark-all-like-this)) ;; mark all matches in the buffer
   (:map mc/keymap
         ("<return>" . nil)) ;; let <return> insert <return> in multiple-cursors mode
)

(provide 'marek-multiple-cursors)
