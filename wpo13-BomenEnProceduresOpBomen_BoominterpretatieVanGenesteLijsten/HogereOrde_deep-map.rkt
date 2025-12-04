#lang racket

(define (atom? x)
    (not (pair? x)))
    
(define (deep-map f l)
  (cond ((null? l) '())
    ((atom? l) (f l))
    (else (cons (deep-map f (car l))
               (deep-map f (cdr l))))))

(deep-map (lambda (x) (* x x))
            '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9))
