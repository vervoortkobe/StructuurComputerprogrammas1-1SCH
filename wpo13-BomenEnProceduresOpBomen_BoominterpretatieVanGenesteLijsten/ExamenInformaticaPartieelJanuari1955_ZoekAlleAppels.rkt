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

(define (all-apples boom)
  (cond ((null? boom) '())
    ((blad? boom) '())
    ((appel? boom) (list (type boom)))
    (else (append (all-apples (car boom))
                  (all-apples (cdr boom))))))

(all-apples boom)
