((auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)))
 (cedet status "installed" recipe
	(:name cedet :website "http://cedet.sourceforge.net/" :description "CEDET is a Collection of Emacs Development Environment Tools written with the end goal of creating an advanced development environment in Emacs." :type bzr :url "bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk" :build
	       `(("sh" "-c" "touch `find . -name Makefile`")
		 ("make" ,(format "EMACS=%s"
				  (shell-quote-argument el-get-emacs))
		  "clean-all")
		 ("make" ,(format "EMACS=%s"
				  (shell-quote-argument el-get-emacs)))
		 ("make" ,(format "EMACS=%s"
				  (shell-quote-argument el-get-emacs))
		  "-C" "contrib"))
	       :build/berkeley-unix
	       `(("sh" "-c" "touch `find . -name Makefile`")
		 ("gmake" ,(format "EMACS=%s"
				   (shell-quote-argument el-get-emacs))
		  "clean-all")
		 ("gmake" ,(format "EMACS=%s"
				   (shell-quote-argument el-get-emacs)))
		 ("gmake" ,(format "EMACS=%s"
				   (shell-quote-argument el-get-emacs))
		  "-C" "contrib"))
	       :build/windows-nt
	       ("echo #!/bin/sh > tmp.sh & echo touch `/usr/bin/find . -name Makefile` >> tmp.sh & echo make FIND=/usr/bin/find >> tmp.sh" "sed 's/^M$//' tmp.sh  > tmp2.sh" "sh ./tmp2.sh" "rm ./tmp.sh ./tmp2.sh")
	       :features nil :lazy nil :post-init
	       (unless
		   (featurep 'cedet-devel-load)
		 (load
		  (expand-file-name "cedet-devel-load.el" pdir)))))
 (color-theme status "installed" recipe
	      (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
		     ("xzf")
		     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
		     (progn
		       (color-theme-initialize)
		       (setq color-theme-is-global t))))
 (color-theme-solarized status "installed" recipe
			(:name color-theme-solarized :description "Emacs highlighting using Ethan Schoonover's Solarized color scheme" :type github :pkgname "sellout/emacs-color-theme-solarized" :depends color-theme :prepare
			       (progn
				 (add-to-list 'custom-theme-load-path default-directory)
				 (autoload 'color-theme-solarized-light "color-theme-solarized" "color-theme: solarized-light" t)
				 (autoload 'color-theme-solarized-dark "color-theme-solarized" "color-theme: solarized-dark" t))))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (setq package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))
			 package-directory-list
			 (list
			  (file-name-as-directory package-user-dir)
			  "/usr/share/emacs/site-lisp/elpa/"))
		   (make-directory package-user-dir t)
		   (unless
		       (boundp 'package-subdirectory-regexp)
		     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
		   (setq package-archives
			 '(("ELPA" . "http://tromey.com/elpa/")
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (rainbow-delimiters status "installed" recipe
		     (:name rainbow-delimiters :website "https://github.com/jlr/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "jlr/rainbow-delimiters"))
 (rainbow-mode status "installed" recipe
	       (:name rainbow-mode :description "Colorize color names in buffers" :minimum-emacs-version 24 :type elpa)))
