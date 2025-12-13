(load "streams.rkt")

(define (merge str1 str2)
  (cond ((empty-stream? str1) str2)
        ((empty-stream? str2) str1)
        ((> (head str1) (head str2)) (merge str2 str1))
        (else (cons-stream (head str1) (merge (tail str1) str2)))))

(define (merge-n streams)
  (if (empty-stream? (tail streams))
      (head streams)
      (merge (head streams) (merge-n (tail streams)))))

(stream-print (merge-n (stream-values
                           (stream-values 1 1 1 2 2 3 4 4 5 6 6 7)
                           (stream-values 1 2 2 2 3 4 4 4 5 6 6 7)
                           (stream-values 3 3 4 4 5 5 6 6 7))))