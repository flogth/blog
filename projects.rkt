#lang at-exp racket/base
(require "common.rkt"
         scribble/html/html
         (except-in scribble/html/extra
                    output map))

(define (project #:href href #:name name #:description desc #:preview [preview '()] #:external [external #f] )
  (article 'class: "project"
           (a 'href: href
              'class: "project-preview"
              (img 'src: preview 'alt: name))
           (h3 (ll #:href href #:name name #:external external))
           (p desc)))

(define projects
  (list
   (project
    #:href "/bg"
    #:name "Wallpaper generator"
    #:preview "./assets/bg.webp"
    #:description "Generate random wallpapers.")
   (project
    #:href "https://github.com/flodobeutlin/dotfiles"
    #:name "Dotfiles"
    #:description "My NixOS system and user configuration"
    #:external #t)))

(define-page content "projects.rkt"
  @h2{projects}
  (section 'class: "projects"
           projects))

(define default (page "projects.html" content))
(provide default)

