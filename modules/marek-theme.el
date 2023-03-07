;;
;; Loads a nice blue theme.
;;
(load-theme 'deeper-blue t)

;;
;; Default font
;;

(when DESKTOP-P
  (let ((my-font (font-spec :family "Iosevka" :weight 'normal :width 'expanded :size 16)))
    (unless (find-font my-font) (setq my-font (font-spec :size 16)))
    (set-frame-font my-font nil t)
  )
)

(provide 'marek-theme)
