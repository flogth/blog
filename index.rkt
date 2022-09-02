#lang racket/base
(require "common.rkt"
         scribble/html/html)

(define content
  (list
   (h2 "Flo's personal Website")
   (p "Hi, this is my personal site. The goal for this site is to be an outlet for writing about things I find interesting. "
      "Topics might include NixOS, Emacs or posts related to Haskell and " (abbr 'title: "Programming Language Theory" "PLT") ". "
      "You will also find some of my web-based " (ll #:href "/projects" #:name "projects") " here. "
      "Let's see how this goes. ")))

(output (site content))
