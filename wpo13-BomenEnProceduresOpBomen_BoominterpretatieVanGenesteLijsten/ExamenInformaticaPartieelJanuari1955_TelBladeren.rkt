#lang racket

(define boom
  '((blad (appel . golden))
    (blad (appel . granny))
    (((appel . golden) blad) blad (appel . cox))))

(define (blad? boom)
  (eq? boom 'blad))

(define (appel? boom)
  (and (pair? boom) (eq? (car boom) 'appel)))

(define (leafs boom)
  (cond ((null? boom) 0)
    ((blad? boom) 1)
    ((appel? boom) 0)
    (else (+ (leafs (car boom))
             (leafs (cdr boom))))))

(leafs boom)
