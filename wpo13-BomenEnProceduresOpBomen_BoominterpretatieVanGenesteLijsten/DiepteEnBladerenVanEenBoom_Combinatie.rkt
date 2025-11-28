(define (atom? x)
  (not (pair? x)))

(define (depth-and-leaf-count tree)
  (define make-res cons)
  (define depth car)
  (define leaf-count cdr)

  (cond ((null? tree) (make-res 0 0))
        ((atom? tree) (make-res 0 1))
        (else (let ((res-car (depth-and-leaf-count (car tree)))
                    (res-cdr (depth-and-leaf-count (cdr tree))))
                (make-res (max (+ 1 (depth res-car))
                               (depth res-cdr))
                          (+ (leaf-count res-car)
                             (leaf-count res-cdr)))))))

(depth-and-leaf-count '((1 2) ((3 4) 5) (6 7)))