#lang at-exp racket/base
(require "common.rkt"
         scribble/html/html
         (except-in scribble/html/extra
                    output map))

(define-page content "blog.rkt"
  @h2{blog}
  @p{More to come...})

(define default (page "blog.html" content))
(provide default)
