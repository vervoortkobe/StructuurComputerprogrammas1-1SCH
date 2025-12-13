(load "streams.rkt")

(define (merge str1 str2)
  (cond ((empty-stream? str1) str2)
        ((empty-stream? str2) str1)
        ((> (head str1) (head str2)) (merge str2 str1))
        (else (cons-stream (head str1) (merge (tail str1) str2)))))

(stream-print (merge (stream-values 1 4 5 6 8 9) (stream-values 1 2 2 3 5 7 7 9)))