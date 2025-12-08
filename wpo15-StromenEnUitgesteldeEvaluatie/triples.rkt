(load "streams.rkt")

(define (odd-sum-triples max)
  (stream-map (lambda (p)
                (let ((l (car p))
                      (r (cadr p)))
                  (list l r (+ l r))))
              (let ((s (stream-filter odd? (enumerate-int 1 (- max 1)))))
                (pairs s s))))

(stream-print (odd-sum-triples 10))