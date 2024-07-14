;; ace-window
(add-to-list 'package-selected-packages 'ace-window)
(use-package ace-window
  :init
  (global-set-key (kbd "C-<tab>") 'ace-window)
  :config
  ;; changes: another <tab> to select the previous window
  (setq aw-dispatch-alist '((?x aw-delete-window "Delete Window")
			    (?m aw-swap-window "Swap Windows")
			    (?M aw-move-window "Move Window")
			    (?c aw-copy-window "Copy Window")
			    (?j aw-switch-buffer-in-window "Select Buffer")
			    (?n aw-flip-window)
			    (?\t aw-flip-window)
			    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
			    (?e aw-execute-command-other-window "Execute Command Other Window")
			    (?F aw-split-window-fair "Split Fair Window")
			    (?v aw-split-window-vert "Split Vert Window")
			    (?b aw-split-window-horz "Split Horz Window")
			    (?o delete-other-windows "Delete Other Windows")
			    (?T aw-transpose-frame "Transpose Frame")
			    ;; ?i ?r ?t are used by hyperbole.el
			    (?? aw-show-dispatch-help)))

;; other-window / previous-window
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; burly
(add-to-list 'package-selected-packages 'burly)
(use-package burly)

(provide 'marek-window-management)
