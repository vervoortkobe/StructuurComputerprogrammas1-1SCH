(define (rec-merge-n lst1 lst2 n)
  (define (merge l1 l2 i)
    (cond 
      ((null? l1) l2)
      ((= i n) (merge l2 l1 0))
      (else (cons (car l1) (merge (cdr l1) l2 (+ i 1))))))
  (merge lst1 lst2 0))

(define (iter-merge-n lst1 lst2 n)
  (define (merge l1 l2 i res)
    (cond
      ((null? l1) (append (reverse res) l2))
      ((= i n) (merge l2 l1 0 res))
      (else (merge (cdr l1) l2 (+ i 1) (cons (car l1) res)))))
  (merge lst1 lst2 0 '()))