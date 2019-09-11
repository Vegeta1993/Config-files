;; -----------------------------------;;
;; use package for easier maintenance ;;
;; -----------------------------------;;

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (require 'use-package))


;; ----------------------------------;;
;; load packages before init         ;;
;; ----------------------------------;;

(setq package-enable-at-startup nil) (package-initialize)

;; ----------------------------------;;
;; Default by emacs                  ;;
;; ----------------------------------;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (atom-dark)))
 '(custom-safe-themes
   (quote
    ("2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" default)))
 '(org-agenda-files
   (quote
    ("~/Documents/Thesis/Org/Classified/Thesis/src/Chapters/Background/Reasoner.org" "~/Documents/Thesis/Org/Classified/Thesis/src/Main.org")))
 '(package-selected-packages
   (quote
    (go-autocomplete use-package org-pdfview org-bullets atom-dark-theme visual-fill-column yasnippet-snippets py-autopep8 org-ref material-theme json-mode jedi flycheck-demjsonlint elpy ein company-jedi company-go better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 168 :width normal)))))

;; ----------------------------------;;
;; Default theme                     ;;
;; ----------------------------------;;

;; deleted theme, probably add repo?
;; (load-theme 'material t)

;; ----------------------------------;;
;; Package repositories              ;;
;; ----------------------------------;;

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpaMilkbox" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; ----------------------------------;;
;; Org mode defaults                 ;;
;; ----------------------------------;;

; directory storing lisp files for auto-captilize
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "auto-capitalize.el")
(require 'auto-capitalize)   ; auto-captilize when necessary automatically
(require 'org-ref)           ; to add citations and add reference
(require 'ox-beamer)         ; beamer exporter
(require 'ox-latex)          

(add-hook 'org-mode-hook 'visual-line-mode)          ; visually move to different lines but not in reality
(add-hook 'org-mode-hook 'visual-fill-column-mode)   ; visually fill columns
(add-hook 'org-mode-hook 'turn-on-flyspell)          ; flyspell to detect spelling mistakes
(add-hook 'org-mode-hook 'auto-capitalize-mode)      ; initialize auto-captilize mode
(add-hook 'org-mode-hook 'column-number-mode)        ; show column number in the bottom
(add-hook 'org-mode-hook 'org-bullets-mode)          ; beautiful bullets for org sections

(setq org-image-actual-width nil)       ; toggling image display in org mode without actual width
(setq org-latex-caption-above nil)      ; Captions are added to the bottom of the image in latex

(add-to-list 'org-latex-packages-alist '("" "minted"))  ; Package minted added to LATEX_HEADER
(setq org-latex-listings 'minted)                       
(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)))                     ; only babel source latex is added (sh, python etc can be added)

; Letter writing in org
(eval-after-load 'ox '(require 'ox-koma-letter))
;; ----------------------------------;;
;; latex compile options             ;;
;; ----------------------------------;;

(setq latex-packages-alist
      (quote (("" "color" t)                   ; color package
	      ("" "libertine" t)               ; font libertine
	      ("" "libertinust1math" t)        ; font libertine math package
	      ("T1" "fontenc" t)               ; fontencoding for pdflatex
	      ("" "minted" t)                  ; minted
	      ("" "tikz" t))                   ; tikz
	     ))
(setq org-latex-create-formula-image-program 'imagemagick)  ; imagemagick is used to display images in org mode

; latex compiler command changed to latexmk with xelatex
(setq org-latex-pdf-process (quote (
				    "latexmk -xelatex -shell-escape -8bit -pdf -output-directory=%o -f %f")))
(setq org-latex-minted-options
     '(("frame" "single")))           ; minted option can be added here

;; ----------------------------------;;
;; org memoir options                ;;
;; ----------------------------------;;

; beautiful and powerful memoir class for writing books
(add-to-list 'org-latex-classes
	     `("memoir"
	       ,(concat           "\\documentclass\[12pt,a4paper,oneside\]\{memoir\}\n"
				  "\\chapterstyle\{veelo\}\n")
	       ("\\chapter{%s}" . "\\chapter*{%s}")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")       
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	     )

; scrbook used for uni-passau Thesis
(add-to-list 'org-latex-classes
	     '("scrbook"
	       "\\documentclass\[fontsize=12pt,paper=a4,oneside,openright,BCOR=1cm\]\{scrbook\}"
	       ("\\chapter{%s}" . "\\chapter*{%s}")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")       
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	     )

; letter class for writing letters. Look up documentation for scrlttr2.
(eval-after-load 'ox-koma-letter
  '(progn
     (add-to-list 'org-latex-classes
                  '("my-letter"
                    "\\documentclass\{scrlttr2\}
     \\usepackage[english]{babel}
     \\setkomavar{frombank}{(1234)\\,567\\,890}
     \[DEFAULT-PACKAGES]
     \[PACKAGES]
     \[EXTRA]"))

     (setq org-koma-letter-default-class "my-letter")))

;; ---------------------------------------;;
;; yasnippet to work with org BEGIN_SRC   ;;
;; ---------------------------------------;;
(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)
(defun my-org-mode-hook ()
  (setq-local yas-buffer-local-condition
              '(not (org-in-src-block-p t))))
(add-hook 'org-mode-hook #'my-org-mode-hook)

;; ---------------------------------------;;
;; Put all temp file ~ in .emacs.d/backup ;;
;; ---------------------------------------;;

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 5   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; -----------------------------------------------;;
;; disable suspend-frame; which is invoked by C-z
;; -----------------------------------------------;;

(global-unset-key (kbd "C-z"))

;; -----------------------------------------------------------------------;;
;; Put compiled tex, pdf into desired folder (Better organization)
;; -----------------------------------------------------------------------;;

;(defvar org-export-output-directory-prefix "../bin" "Prefix name")
;
;(defadvice org-export-output-file-name (before org-add-export-dir activate)
;  "Modifies org-export to place exported files in a different directory"
;  (when (not pub-dir)
;      (setq pub-dir (concat org-export-output-directory-prefix (substring extension 1)))
;      (when (not (file-directory-p pub-dir))
;	(make-directory pub-dir))))


;; ---------------------------------------;;
;; Key bindings
;; ---------------------------------------;;

(define-key org-mode-map (kbd "<f12>") 'flyspell-auto-correct-previous-word) ; shortcut to correct previous wrong word

;; ---------------------------------------;;
;; Python mode
;; ---------------------------------------;;

(elpy-enable)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'run-python-internal)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; JSON flycheck
(add-hook 'json-mode-hook #'flycheck-mode)

;; ---------------------------------------;;
;; Go mode
;; ---------------------------------------;;

(defun my/go-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'go-mode-hook 'my/go-mode-hook)
(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'auto-complete-mode)
;(add-to-list 'ac-modes 'go-mode)

;; ------------------------------------------------;;
;; Pdf-tools install; Annotate pdf directly in emacs
;; ------------------------------------------------;;

;(use-package pdf-tools
;	     :ensure t)

;(use-package org-pdfview
;	     :ensure t)
;; ---------------------------------------;;
