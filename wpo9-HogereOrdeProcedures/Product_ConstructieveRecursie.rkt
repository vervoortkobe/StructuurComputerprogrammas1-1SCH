(define (product factor a next b)
  (if (> a b)
      1
      (* (factor a) (product factor (next a) next b))))

(product (lambda (a) a) 2 (lambda (a) (+ a 2)) 6)