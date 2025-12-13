(load "streams.rkt")

(define (prune stream n)
  (define (hulp stream i doorlaten?)
    (cond ((empty-stream? stream) the-empty-stream)
          ((>= i n) (hulp stream 0 (not doorlaten?)))
          (doorlaten? (cons-stream (head stream)
                                   (hulp (tail stream)
                                   (+ i 1)
                                   doorlaten?)))
    (else (hulp (tail stream) (+ i 1) doorlaten?))))
  (hulp stream 0 #t))

(stream-print (prune (stream-values 1 2 3 4 5 6 7 8 9) 2))