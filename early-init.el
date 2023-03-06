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
    (setq exec-path (append exec-path (list termuxpath))))

  ;; Fix SSL connection.
  ;;
  ;; Android port is builded without gnutls support and uses 'gnutls-cli' command.
  ;; 'gnutls' command line must be installed in Termux.
  ;; This removes '%t' (filepath with trused certificates) from original command line, as it causes the error.
  ;; "--x509cafile /data/data/com.termux/files/usr/etc/tls/cert.pem' was also not working".
  ;; 'openssl' is not working at all.
  (setq tls-program '("gnutls-cli -p %p %h"
		      "gnutls-cli -p %p %h --protocols ssl3"
		      ;"openssl s_client -connect %h:%p -no_ssl2 -ign_eof")
  )
)
