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

(add-to-list 'package-vc-selected-packages '(combobulate :url "https://github.com/chaoyi/combobulate.git"))
(package-vc-install-selected-packages)
(use-package combobulate
  ;;:vc (:url "https://github.com/chaoyi/combobulate.git" :lisp-dir "./")
  :load-path (lambda () (convert-standard-filename (expand-file-name "elpa/combobulate/" user-emacs-directory)))
  :custom
  ;; You can customize Combobulate's key prefix here.
  ;; Note that you may have to restart Emacs for this to take effect!
  (combobulate-key-prefix "C-c o")
  :hook ((prog-mode . combobulate-mode))
  )


(provide 'marek-treesitter)
