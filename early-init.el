;;
;; Environment
;;

(defconst ANDROID-P (string-equal system-type "android"))

(let ((model (when ANDROID-P (string-trim (shell-command-to-string "getprop ro.product.model")))))
  (defconst EINK-TABLET-P (and model (string-equal model "NoteAir5C")))
)

(defconst WORK-LINUX-P (or (string-equal (system-name) "WorkLaptop") (string-equal (system-name) "marek-worklaptop")))
(defconst HOME-LINUX-P (or (string-equal (system-name) "marek-desktop") (string-equal (system-name) "marek-laptop")))

(defconst DESKTOP-P (or WORK-LINUX-P HOME-LINUX-P))

;;
;; Conditions at which to initialize which modules.
;;

(defconst LSP-JAVA-P WORK-LINUX-P)
(defconst LSP-PYTHON-P DESKTOP-P)
(defconst LSP-RUST-P (or HOME-LINUX-P WORK-LINUX-P EINK-TABLET-P))
(defconst LSP-P (or LSP-JAVA-P LSP-PYTHON-P LSP-RUST-P))

;;
;; On Android, integrate with Termux
;;

(when ANDROID-P
  ;; Add Termux binaries to PATH environment
  (setq exec-path '("/data/data/com.termux/files/usr/bin" "."))
  (setenv "PATH" "/data/data/com.termux/files/usr/bin:.")

  ;; faster command execution (disable system call tracing)
  (setq android-use-exec-loader 'nil)
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

;;
;; Garbage collection settings
;;

;; print messages about GC starting/stopping
;;(setq garbage-collection-messages t)

;; disable GC on startup
(setq gc-cons-threshold most-positive-fixnum)

;; after the startup
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq my-gc-cons-threshold (* 8 1024 1024))

	    (setq gc-cons-threshold my-gc-cons-threshold)
	    (setq gc-cons-percentage 0.5)

	    ;; run gc collect when Emacs is idle
	    (run-with-idle-timer 5 t #'garbage-collect)

	    ;; disable garbage collection when in minibuffer
	    (defun my-minibuffer-setup-hook ()
	      (setq gc-cons-threshold most-positive-fixnum))
	    (defun my-minibuffer-exit-hook ()
	      (setq gc-cons-threshold my-gc-cons-threshold))
	    (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
	    (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
))
