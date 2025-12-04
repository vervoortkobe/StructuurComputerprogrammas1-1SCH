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

(define (count-atoms l)
  (deep-combine
    +
    0
  (deep-map (lambda (x) 1) l)))

(count-atoms '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9))
