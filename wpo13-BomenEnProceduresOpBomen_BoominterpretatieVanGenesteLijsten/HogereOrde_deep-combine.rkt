#lang racket

(define (atom? x)
    (not (pair? x)))

(define (deep-combine combiner null-value l)
  (cond ((null? l) null-value)
    ((atom? l) l)
    (else (combiner (deep-combine combiner null-value (car l))
                    (deep-combine combiner null-value (cdr l))))))

(deep-combine + 0 '((((1 2) (3 4)) ((5 6) (7 8))) 9))
