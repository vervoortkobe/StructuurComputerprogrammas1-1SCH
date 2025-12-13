(load "streams.rkt")

(define integers
  (cons-stream 1 
               (stream-map 
                 (lambda (x) 
                   (+ x 1)) 
                 integers)))

(define div? (lambda (x y) (eq? (modulo x y) 0)))

(define (integers-special stream)
  (stream-filter (lambda (x) (not (or (div? x 2)
                                      (div? x 3)
                                      (div? x 5))))
                 stream))