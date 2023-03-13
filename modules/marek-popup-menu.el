(add-to-list 'package-selected-packages 'popup-edit-menu)
(use-package popup-edit-menu
  :config
  (global-set-key [mouse-3] (popup-edit-menu-stub)))

; Readonly option
(define-key-after global-map [menu-bar edit read-only-mode] `("Readonly" . read-only-mode) 'fill)
; TODO: checkbox is not working - but it is for example for blink-cursor-mode
;(define-key-after global-map [menu-bar edit read-only-mode]
;  (menu-bar-make-mm-toggle
;   	read-only-mode
;	"Readonly"
;	"Enable read-only-mode"
;  )
;  'fill)

(provide 'marek-popup-menu)