(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(c "https://github.com/tree-sitter/tree-sitter-c")
	(c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
	(cmake "https://github.com/uyha/tree-sitter-cmake")
	(cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(go "https://github.com/tree-sitter/tree-sitter-go")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(java "https://github.com/tree-sitter/tree-sitter-java")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(rust "https://github.com/tree-sitter/tree-sitter-rust")
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;;(add-to-list 'package-vc-selected-packages '(combobulate :url "https://github.com/marek-g/combobulate.git" :branch "rust"))
;;(package-vc-install-selected-packages)
(when HOME-LINUX-P
	(use-package combobulate
	:load-path ("~/Ext/Src/libs/3rdparty/combobulate/"
					"~/Ext/Src/libs/3rdparty/combobulate/tests/")
	:config
	(require 'combobulate-test-prelude)
	(require 'combobulate-debug)
	;;:vc (:url "https://github.com/chaoyi/combobulate.git" :lisp-dir "./")
	;;:load-path (lambda () (convert-standard-filename (expand-file-name "elpa/combobulate/" user-emacs-directory)))
	:custom
	;; You can customize Combobulate's key prefix here.
	;; Note that you may have to restart Emacs for this to take effect!
	(combobulate-key-prefix "C-c o")
	:bind (:map combobulate-key-map
			("C-M-<left>" . combobulate-navigate-previous)
			("C-M-<right>" . combobulate-navigate-next)
			("C-M-<up>" . combobulate-navigate-up)
			("C-M-<down>" . combobulate-navigate-down)
			("C-M-<home>" . combobulate-navigate-beginning-of-defun)
			("C-M-<end>" . combobulate-navigate-end-of-defun)
			("C-M-<prior>" . combobulate-navigate-sequence-previous)
			("C-M-<next>" . combobulate-navigate-sequence-next)
			("C-M-S-<left>" . combobulate-mark-node-dwim)
			("M-<left>" . nil)
			("M-<right>" . nil))
	:hook ((prog-mode . combobulate-mode))
	)
)

(provide 'marek-treesitter)
