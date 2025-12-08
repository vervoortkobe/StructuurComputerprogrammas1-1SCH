(load "streams.rkt")

(define (fac n)
  (if (= n 0)
      1
      (* n (fac (- n 1)))))

(define (calc-e n)
  (stream-accumulate + 0
                     (stream-map
                      (lambda (x) (/ 1 (fac x)))
                      (enumerate-int 0 n))))

(define (sinus x n)
  (define (calc-term t)
    (if (odd? (/ (- t 1) 2))
        (* -1 (/ (expt x t) (fac t)))
        (/ (expt x t) (fac t))))
  (stream-accumulate + 0
                     (stream-map
                      calc-term
                      (stream-filter odd?
                                     (enumerate-int 0 (* n 2))))))

(exact->inexact (calc-e 10))
(sinus (/ 3.1415 2) 10)