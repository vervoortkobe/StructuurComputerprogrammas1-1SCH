(define (all? pred l)
  (cond
    ((null? l) #t)
    ((pred (car l)) (all? pred (cdr l)))
    (else #f)))
