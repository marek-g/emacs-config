;;
;; Toolbar
;;
(when ANDROID-P
  (customize-set-variable 'tool-bar-button-margin 15)
  (customize-set-variable 'tool-bar-position 'bottom)
  )

(if (not ANDROID-P)
    (tool-bar-mode -1)) ; hide toolbar on non Android system

(provide 'marek-toolbar)
