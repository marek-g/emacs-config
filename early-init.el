;;
;; Environment
;;

(defconst ANDROID-P (string-equal system-type "android"))

(defconst WORK-LINUX-P (string-equal (system-name) "WorkLaptop"))
(defconst HOME-LINUX-P (or (string-equal (system-name) "marek-desktop") (string-equal (system-name) "marek-laptop")))

(defconst DESKTOP-P (or WORK-LINUX-P HOME-LINUX-P))

;;
;; Conditions at which to initialize which modules.
;;

(defconst LSP-JAVA-P nil) ;(defconst LSP-JAVA-P WORK-LINUX-P)
(defconst LSP-PYTHON-P DESKTOP-P)
(defconst LSP-RUST-P HOME-LINUX-P)
(defconst LSP-P (or LSP-JAVA-P LSP-PYTHON-P LSP-RUST-P))

;;
;; On Android, integrate with Termux
;;

(when ANDROID-P
  ;; Add Termux binaries to PATH environment
  (setq exec-path '("/data/data/com.termux/files/usr/bin" "."))
  (setenv "PATH" "/data/data/com.termux/files/usr/bin:.")
)

;;
;; Native compilation settings
;;

(when (featurep 'native-compile)
  ;; Silence compiler warnings as they can be pretty disruptive
  (setq native-comp-async-report-warnings-errors nil)

  ;; Make native compilation happens asynchronously
  (setq native-comp-deferred-compilation t)

  ;; Set the right directory to store the native compilation cache
  ;; NOTE the method for setting the eln-cache directory depends on the emacs version
  (when (fboundp 'startup-redirect-eln-cache)
    (if (version< emacs-version "29")
        (add-to-list 'native-comp-eln-load-path (convert-standard-filename (expand-file-name ".cache/eln-cache/" user-emacs-directory)))
      (startup-redirect-eln-cache (convert-standard-filename (expand-file-name ".cache/eln-cache/" user-emacs-directory))))))
