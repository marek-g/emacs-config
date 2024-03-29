(load (expand-file-name "libs/cheatsheet.el" user-emacs-directory))

(define-key global-map [f1] 'cheatsheet-toggle-window)

(cheatsheet-add :group 'Help
                :key "C-h"
                :description "Emacs' help.")

(cheatsheet-add :group 'Help
                :key "F1"
                :description "show / hide help cheatsheet.")


(cheatsheet-add :group "Text Edit"
                :key "C-S-z"
                :description "vundo (undo tree).")

(cheatsheet-add :group "Text Edit"
                :key "C-y"
                :description "redo.")

(cheatsheet-add :group "Text Edit"
                :key "C-z"
                :description "undo.")


(cheatsheet-add :group "Macros"
                :key "(C-u N) C-e e"
                :description "execute keyboard macro (optionally repeat N times, where N = 0 - till EOF).")

(cheatsheet-add :group "Macros"
                :key "C-e )"
                :description "stop recording keyboard macro.")

(cheatsheet-add :group "Macros"
                :key "C-e ("
                :description "start recording keyboard macro.")


(cheatsheet-add :group "Search"
                :key "C-F3"
                :description "exit search mode.")

(cheatsheet-add :group "Search"
                :key "S-F3"
                :description "search repeat backward.")

(cheatsheet-add :group "Search"
                :key "F3"
                :description "search repeat forward.")

(cheatsheet-add :group "Search"
                :key "C-f"
                :description "search.")


(cheatsheet-add :group "Navigation"
                :key "M-<left>, M-<right>"
                :description "backward, forward location.")

(cheatsheet-add :group "Navigation"
                :key "M-{, M-}"
                :description "previous, next paragraph.")

(cheatsheet-add :group "Navigation"
                :key "C-M-p, C-M-n"
                :description "previous, next parentheses on the same level.")

(cheatsheet-add :group "Navigation"
                :key "C-M-<up>, C-M-<down>"
                :description "element level up, element level down.")

(cheatsheet-add :group "Navigation"
                :key "C-M-<left>, C-M-<right>"
                :description "previous, next element, same level.")


(cheatsheet-add :group "Window management"
                :key "C-tab"
                :description "switch active window.")

(cheatsheet-add :group "Window management"
                :key "s-k"
                :description "close window.")


(cheatsheet-add :group "Buffers"
                :key "M-space, C-b"
                :description "switch buffer.")

(cheatsheet-add :group "Buffers"
                :key "C-n"
                :description "new buffer.")


(cheatsheet-add :group "Window management"
                :key "s-v"
                :description "split window vertically.")

(cheatsheet-add :group "Window management"
                :key "s-h"
                :description "split window horizontally.")

(cheatsheet-add :group "Code"
                :key "<F12>, M-<F12>, C-<F12>, S-<F12>"
                :description "find definition, type definition, declaration, references.")

(cheatsheet-add :group "Code"
                :key "C-., M-RET"
                :description "code action.")

(cheatsheet-add :group "Code"
                :key "C-SPC"
                :description "completion.")


(provide 'marek-cheatsheet)
