(define (iter-sum-lists l1 l2)
  (define (iter l1 l2 acc)
    (cond
      ((null? l1) (append (reverse acc) l2))
      ((null? l2) (append (reverse acc) l1))
      (else (iter (cdr l1) (cdr l2)
                  (cons (+ (car l1) (car l2)) acc)))))
  (iter l1 l2 '()))

(define (rec-sum-lists l1 l2)
  (cond
    ((null? l1) l2)
    ((null? l2) l1)
    (else (cons (+ (car l1) (car l2))
                (sum-lists (cdr l1) (cdr l2))))))