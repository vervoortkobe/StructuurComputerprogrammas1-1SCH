#lang racket

(define (atom? x)
    (not (pair? x)))

(define (deep-combine combiner null-value l)
  (cond ((null? l) null-value)
    ((atom? l) l)
    (else (combiner (deep-combine combiner null-value (car l))
                    (deep-combine combiner null-value (cdr l))))))

(define (deep-map f l)
  (cond ((null? l) '())
    ((atom? l) (f l))
    (else (cons (deep-map f (car l))
               (deep-map f (cdr l))))))

(define(deep-atom-member? e l)
  (deep-combine
    (lambda (x y) (or x y))
    #f
  (deep-map (lambda (x) (eq? x e)) l)))

(deep-atom-member? 3 '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9))
(deep-atom-member? 999 '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9))
