(define (atom? x)
    (not (pair? x)))

(define (leaf-count tree)
  (cond ((null? tree) 0)
  ((atom? tree) 1)
  (else (+ (leaf-count (car tree))
                       (leaf-count (cdr tree))))))

(leaf-count '((1 2) ((3 4) 5) (6 7)))