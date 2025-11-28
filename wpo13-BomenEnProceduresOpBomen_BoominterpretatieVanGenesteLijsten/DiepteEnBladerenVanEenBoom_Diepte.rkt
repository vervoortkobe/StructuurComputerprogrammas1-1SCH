(define (atom? x)
    (not (pair? x)))

(define (depth tree)
  (cond ((atom? tree) 0)
        ((null? tree) 0)
        (else (max (+ 1 (depth (car tree)))
                   (depth (cdr tree))))))

(depth '((1 2) ((3 4) 5) (6 7)))