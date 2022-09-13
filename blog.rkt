#lang at-exp racket/base
(require "common.rkt"
         racket/match
         scribble/html/html
         (except-in scribble/html/extra
                    output map)
         
         (prefix-in test/ "posts/test.rkt"))

(provide default
         ;; (all-from-out "posts/test.rkt")
         )

(define-page content "blog.rkt"
  @h2{blog}
  (ll #:href "posts/test" #:name "test")
  @p{More to come...})

(define default (page "blog.html" content))

