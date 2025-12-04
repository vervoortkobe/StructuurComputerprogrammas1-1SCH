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

(define (union l1 l2)
  (cond ((null? l1) l2)
    ((member (car l1) l2) (union (cdr l1) l2))
    (else (cons (car l1) (union (cdr l1) l2)))))

(define (apple-types boom)
  (cond ((null? boom) '())
    ((blad? boom) '())
    ((appel? boom) (list (type boom)))
    (else (union (apple-types (car boom))
                 (apple-types (cdr boom))))))

(apple-types boom)
