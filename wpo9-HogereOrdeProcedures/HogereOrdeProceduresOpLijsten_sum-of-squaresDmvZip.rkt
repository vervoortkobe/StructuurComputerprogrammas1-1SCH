(define (zip lst1 lst2 combine)
  (cond
    ((or (null? lst1)(null? lst2) ) '())
    (else
     (cons (combine  (car lst1) (car lst2))
     (zip (cdr lst1) (cdr lst2) combine)))))



(define (square x)
  (* x x))

(define (sum-of-squares lst1 lst2)
  (zip (map square lst1) (map square lst2) +))
