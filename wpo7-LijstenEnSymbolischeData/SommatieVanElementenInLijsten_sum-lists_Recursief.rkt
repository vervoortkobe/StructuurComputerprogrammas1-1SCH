(define (rec-sum-lists l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        (else (cons (+ (car l1) (car l2))
                    (rec-sum-lists (cdr l1) (cdr l2)))))
  )

(rec-sum-lists '(1 2 3) '(5 6 7))

(define (iter-sum-lists l1 l2)
  (define (iter l1 l2 res)
    (cond ((null? l1) (append (reverse res) l2))
          ((null? l2) (append (reverse res) l1))
          (else (iter (cdr l1) (cdr l2) (cons (+ (car l1) (car l2)) res)))))
  (iter l1 l2 '()))

(iter-sum-lists '(1 2 3) '(5 6 7))

(define (iter-sum-lists2 l1 l2)
  (define (iter l1 l2 res)
    (cond ((and (null? l1) (null? l2)) (reverse res))
          ((null? l1) (iter l1 (cdr l2) (cons (car l2) res)))
          ((null? l2) (iter (cdr l1) l2 (cons (car l1) res)))
          (else (iter (cdr l1) (cdr l2) (cons (+ (car l1) (car l2)) res)))))
  (iter l1 l2 '()))

(iter-sum-lists2 '(1 2 3) '(5 6 7))