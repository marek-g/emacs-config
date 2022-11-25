(load! "packages/cheatsheet.el")

(define-key global-map [f1] 'cheatsheet-toggle-window)

(cheatsheet-add :group 'Common
                :key "C-x C-c"
                :description "leave Emacs.")
