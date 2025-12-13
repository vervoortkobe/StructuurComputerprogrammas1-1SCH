(load "streams.rkt")

(define integers
  (cons-stream 1 
               (stream-map 
                 (lambda (x) 
                   (+ x 1)) 
                 integers)))

(define (triplets)
 (stream-filter (lambda (l)
                  (let ((i (car l))
                        (j (cadr l))
                        (k (caddr l)))
                    (< k ( + j))))
                (stream-map (lambda (e)
                                     (list (caar e) (cadar e) (cadr e)))
                            (pairs (pairs integers integers) integers))))
  
(take (triplets) 4)