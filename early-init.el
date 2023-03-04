;;
;; Environment
;;

(defconst ANDROID-P (string-equal system-type "android"))

(defconst WORKDESKTOP-P (string-equal (system-name) "WorkLaptop"))
(defconst HOMEDESKTOP-P (string-equal (system-name) "marek-linux"))

(defconst DESKTOP-P (or WORKDESKTOP-P HOMEDESKTOP-P))

;;
;; Conditions at which to initialize which modules.
;;

(defconst LSP-JAVA-P WORKDESKTOP-P)
(defconst LSP-RUST-P HOMEDESKTOP-P)
(defconst LSP-P (or LSP-JAVA-P LSP-RUST-P))

;;
;; On Android, integrate with Termux
;;

(when ANDROID-P
  ;; Add Termux binaries to PATH environment
  (let ((termuxpath "/data/data/com.termux/files/usr/bin"))
    (setenv "PATH" (concat (getenv "PATH") ":" termuxpath))
    (setq exec-path (append exec-path (list termuxpath)))))

;;
;; Loads a nice blue theme, avoids the white screen flash on startup.
;;
(load-theme 'deeper-blue t)
