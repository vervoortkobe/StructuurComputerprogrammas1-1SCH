(define (1- x) (- x 1))
(define (1+ x) (+ 1 x))

(define (iter-add a b)
  (if (= b 0)
      a
      (iter-add (1+ a) (1- b))))