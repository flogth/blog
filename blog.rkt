#lang racket/base
(require "common.rkt"
         scribble/html/html
         (except-in scribble/html/extra
                    output map))

(define content
  (list
   (h2 "blog")
   (p "More to come...")))

(output (site content))
