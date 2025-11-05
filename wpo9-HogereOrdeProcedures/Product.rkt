(define (sum (term a next b)
             (if (> a b)
                 0
                 (+ (term a) (sum term (next a) next b)))))

(define id (lambda (x) x))

(sum (lambda (x) x)
     1
     (lambda (x) (+ x 1))
     10)