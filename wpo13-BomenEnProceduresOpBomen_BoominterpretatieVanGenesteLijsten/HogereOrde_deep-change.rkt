#lang racket

(define (atom? x)
    (not (pair? x)))
    
(define (deep-map f l)
  (cond ((null? l) '())
    ((atom? l) (f l))
    (else (cons (deep-map f (car l))
               (deep-map f (cdr l))))))

(define (deep-change e1 e2 l)
  (deep-map (lambda (e) 
              (if (eq? e e1) e2 e)) l))

(deep-change 3 999 '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9))
