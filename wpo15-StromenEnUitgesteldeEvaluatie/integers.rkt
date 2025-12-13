(load "streams.rkt")

(define integers
  (cons-stream 1 
               (stream-map 
                 (lambda (x) 
                   (+ x 1)) 
                 integers)))
