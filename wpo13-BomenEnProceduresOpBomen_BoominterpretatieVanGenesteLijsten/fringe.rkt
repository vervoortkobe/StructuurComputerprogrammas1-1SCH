(define (atom? x)
    (not (pair? x)))

(define (fringe l)
  (cond ((null? l) '())
  ((atom? l) (list l))
  (else (append (fringe (car l))
                (fringe (cdr l))))))