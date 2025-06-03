;;
;; Toolbar
;;
(when ANDROID-P
  (customize-set-variable 'tool-bar-button-margin 15)
  (customize-set-variable 'tool-bar-position 'bottom)
  )

(if (not ANDROID-P)
    (tool-bar-mode -1)) ; hide toolbar on non Android system

;;
;; Icons
;;

(tool-bar-add-item "index" 'treemacs 'treemacs :help "Treemacs")

(tool-bar-add-item "last-page" 'previous-buffer 'previous-buffer :help "Previous buffer")

(tool-bar-add-item "next-page" 'next-buffer 'next-buffer :help "Next buffer")

(provide 'marek-toolbar)
