#lang racket/base
(require "common.rkt"
         scribble/html/html
         (except-in scribble/html/extra
                    output map))

(define content
  (list
   (h2 "about")
   (section
    (h3 "me")
    (p "I am Florian Guthmann, a software developer and computer science student at "
       (abbr 'title: "Friedrich-Alexander-Universität Erlangen-Nürnberg" "FAU") ".")
    (p "My username " (em "flodobeutlin") " is a (arguably terrible) pun comprised of a portmanteau of " (em "Frodo") " and my nickname " (em "Flo") " as well as " (em "Beutlin") ", the german version of the last name Baggins in " (abbr 'title: "Lord Of The Rings" "LOTR") "." )
    (p "Next to this site I also have a "
       (ll #:href "https://wwwcip.cs.fau.de/~oc45ujef" #:name "university website")
       " where I host miscellaneous content related to my studies."))
   (section
    (h3 "this page")
    (p "This website is generated using a collection of racket scripts based on the great "
       (ll #:href "https://docs.racket-lang.org/scribble" #:name (code "#lang scribble"))
       " , though I only use it as a library for generating html from s-expressions."
       " Find the source " (ll #:href "https://github.com/flodobeutlin/blog" #:name "here") ".")
    (p "The color scheme(s) are shamelessly ripped of emacs's "
       (ll #:href "https://github.com/protesilaos/modus-themes" #:name (code "modus-themes")) "."))))

(output (site content))
