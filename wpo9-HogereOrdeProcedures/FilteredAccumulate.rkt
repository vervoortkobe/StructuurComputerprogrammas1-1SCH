(define  (filtered-accumulate combiner filter? null-value term a next b)
  (define (iter a res)
    (if (> a b)
        res 
        (iter (next a) (if (filter? a)
                           (combiner (term a) res)
                           res))))
  (iter a null-value))

(filtered-accumulate
 +
 even?
 0
 (lambda (a) a)
 1
 (lambda (a) (+ a 1))
 9)