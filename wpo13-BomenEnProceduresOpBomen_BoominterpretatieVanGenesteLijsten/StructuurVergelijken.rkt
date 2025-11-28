#lang racket

(define (atom? x)
    (not (pair? x)))

(define (same-structure? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t)
        ((or (null? l1) (null? l2)) #f)
        ((and (atom? l1) (atom? l2)) #t)
        ((or (atom? l1) (atom? l2)) #f)
        (else (and (same-structure? (car l1) (car l2))
                   (same-structure? (cdr l1) (cdr l2))))))

(same-structure? '((1 2) ((3 . 4) ((5 6) ((7 8) (9)))))
                   '((a b) ((c . d) ((e f) ((g h) (i))))))
(same-structure? '((1 2) ((3 4) ((5 6) ((7 8) (9)))))
                   '((((1 2) (3 4)) ((5 6) (7 8))) 9))