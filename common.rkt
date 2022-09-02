#lang racket/base
(require scribble/html/html
         (except-in scribble/html/extra
                    map)
         scribble/html/xml
         racket/date
         racket/match)

(provide (all-defined-out))


(define (css href)
  (link 'rel: "stylesheet" 'type: "text/css" 'href: href))

(define (now)
  (date-display-format 'iso-8601)
  (date->string (current-date)))



(define (ll #:href href #:name name #:external [external #f] )
  (if external
      (a 'href: href 'class: "external" name)
      (a 'href: href name)))

(define (srclink #:name name)
  (let ([rkt (find-system-path 'run-file)])
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
  (header (div 'class: "header-logo" (a 'href: "/" "flodobeutlin"))
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

(define mfoot
  (footer
   (time 'datetime: (now) (now))
   (span author)
   (srclink #:name "src")))


(define (site content)
  (html 'lang: "de"
        mhead
        (body
         (mheader)
         (main content)
         (mfoot))))

(define (output s)
  (output-xml (list (doctype 'html) s)))
