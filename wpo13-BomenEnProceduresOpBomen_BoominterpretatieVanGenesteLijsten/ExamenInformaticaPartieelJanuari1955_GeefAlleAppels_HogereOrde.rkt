#lang racket

(define boom
  '((blad (appel . golden))
    (blad (appel . granny))
    (((appel . golden) blad) blad (appel . cox))))

(define (blad? boom)
  (eq? boom 'blad))

(define (appel? boom)
  (and (pair? boom) (eq? (car boom) 'appel)))

(define (type appel)
  (cdr appel))

(define (bewerk-boom boom doe-blad doe-appel combiner init)
  (cond ((null? boom) init)
    ((blad? boom) (doe-blad boom))
    ((appel? boom) (doe-appel boom))
    (else (combiner (bewerk-boom (car boom) doe-blad doe-appel combiner init)
                    (bewerk-boom (cdr boom) doe-blad doe-appel combiner init)))))

(define (all-apples-dmv-bewerk boom)
  (bewerk-boom boom
               (lambda (blad) '())
               (lambda (appel) (list (type appel)))
               append
               '()))

(all-apples-dmv-bewerk boom)

(define (all-apple-types-dmv-bewerk boom)
  (bewerk-boom boom
               (lambda (blad) '())
               (lambda (appel) (list (type appel)))
               union
               '()))
