#lang at-exp racket/base
(require "../common.rkt"
         scribble/html/html)

(define-page content "test.rkt"
  @h2{testarticle}
  @p{More to come... 2})

(define default (page "blog/test.html" content))
(provide default)

