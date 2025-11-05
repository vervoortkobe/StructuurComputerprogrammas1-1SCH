(define (accumulate combiner null-value term a next b)
   (define (iter a res)
     (if (> a b)
        res
        (iter (next a) (combiner (term a) res))))
  (iter a null-value))

(define (add a  b)
  (accumulate + a (lambda (x) 1) 1 (lambda (x) (+ x 1)) b))

(define (multiply a b)
  (accumulate + 0 (lambda (x) a) 1 (lambda (x) (+ x 1)) b))

(add 4 10)
(multiply 4 10)
