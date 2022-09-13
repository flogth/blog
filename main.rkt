#lang racket/base
(require
 racket/cmdline
 "common.rkt"
 (prefix-in index/ "index.rkt")
 (prefix-in blog/ "blog.rkt")
 (prefix-in projects/ "projects.rkt")
 (prefix-in about/ "about.rkt"))

(define out-dir
  (or (vector-ref (current-command-line-arguments) 1)
      "public"))

(unless (directory-exists? out-dir)
  (debugln "Creating output directory \"~a\"" out-dir)
  (make-directory out-dir))

(output-page out-dir index/default)
(output-page out-dir blog/default)
(output-page out-dir projects/default)
(output-page out-dir about/default)

;; posts
;; (output-page out-dir blog/test/default)
