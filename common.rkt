#lang racket/base
(require scribble/html/html
         (except-in scribble/html/extra
                    map)
         scribble/html/xml
         racket/date
         racket/match)

(provide (all-defined-out))

(define current-page
  (make-parameter null))

(define (css href)
  (link 'rel: "stylesheet" 'type: "text/css" 'href: href))

(define (now)
  (date-display-format 'iso-8601)
  (date->string (current-date)))

(define (debugln s . v)
  (eprintf "[INFO] ~a\n" (apply format s v)))

(define (ll #:href href #:name name #:external [external #f] )
  (if external
      (a 'href: href 'class: "external"
         'target: "_blank" 'rel: "noreferrer" name)
      (a 'href: href name)))

(define (srclink #:name name)
  (let ([rkt (current-page)])
    (ll #:href rkt #:name name)))

(define (pl . ls)
  (p (map (lambda (l) (string-append l "\n")) ls)))

(define mnav
  (nav (ul
        (li (ll #:href "/blog" #:name "blog"))
        (li (ll #:href "/projects" #:name "projects"))
        (li (ll #:href "/about" #:name "about"))
        (li (ll #:href "https://github.com/flodobeutlin" #:name "code" #:external #t)))))

(define mheader
  (header
   (a 'id: "skiptocontent" 'href: "#main-content" "Skip to main content")
   (div 'class: "header-logo" (a 'href: "/" "flodobeutlin"))
   (mnav)))
(define author "Florian Guthmann")

(define mtitle "Flo's personal Website")

(define mhead
  (head
   (title mtitle)
   (meta 'charset: "utf-8")
   (meta 'name: "description" 'content: mtitle)
   (meta 'name: "viewport" 'content: "width=device-width, initial-scale=1")
   (link 'rel: "icon" 'href: "assets/favicon.ico" 'type: "image/x-icon")
   (css "style.css")))

(define (mfoot)
  (footer
   (time 'datetime: (now) (now))
   (span author)
   (srclink #:name "Peel slowly and see")))


(define (site p)
  (parameterize ([current-page (path-replace-extension (page-path p) ".rkt")])
    (debugln (path->string (current-page)))
    (list (doctype 'html)
          (html 'lang: "de"
                mhead
                (body
                 (mheader)
                 (main 'id: "main-content"
                       'tabindex: -1
                       (page-content p))
                 (mfoot))))))

(define (output-page dir p)
  (let* ([out (build-path dir (page-path p))]
         [src (path-replace-extension (page-path p) ".rkt")]
         [srcout (build-path dir src)])
    (match-let-values ([(d _ _) (split-path out)])
      (unless (directory-exists? d)
        (debugln "Creating output directory \"~a\"" d)
        (make-directory d)))
    (with-output-to-file out
      (lambda ()
        (debugln "Producing ~a" (page-path p))
        (output-xml (site p)))
      #:exists 'replace)
    (debugln "Copying ~a" src)
    (copy-file src srcout #t)))

(define-syntax-rule (define-page name content ...)
  (define name (list content ...)))

(struct page (path content) #:transparent)
