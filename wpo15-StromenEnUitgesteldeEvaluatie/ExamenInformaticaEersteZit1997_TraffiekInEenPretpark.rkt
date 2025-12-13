(load "streams.rkt")

(define (print-m matrix)
  (display "[")
  (stream-print (head matrix)) (newline)
  (stream-for-each (lambda (x) (display " ")
                     (stream-print x) (newline))
                   (tail matrix))
  (display "]\n"))

(define (cut stream)
  (define (split head-stream stream e)
    (cond
      ((empty-stream? stream)
       (cons head-stream stream))
      ((not (= e (head stream)))
       (cons head-stream stream))
      (else
       (split (cons-stream e head-stream)
              (tail stream)
              e))))

  (if (empty-stream? stream)
      the-empty-stream
      (let ((tmp (split the-empty-stream stream (head stream))))
        (cons-stream (car tmp)
                     (cut (cdr tmp))))))

(define (merge str1 str2)
  (cond ((empty-stream? str1) str2)
        ((empty-stream? str2) str1)
        ((> (head str1) (head str2)) (merge str2 str1))
        (else (cons-stream (head str1) (merge (tail str1) str2)))))

(define (merge-n streams)
  (if (empty-stream? (tail streams))
      (head streams)
      (merge (head streams) (merge-n (tail streams)))))

(define (pretpark-traffiek stream)
  (stream-map (lambda (x)
                (cons (head x)
                      (stream-accumulate +
                                         0
                      (stream-map (lambda (el) 1) x))))
  (cut (merge-n stream))))

(stream-print
 (pretpark-traffiek (stream-values
                     (stream-values 1 1 1 2  2 3 4  4 5 6 6 7)
                     (stream-values  1 2 2 2 3 4 4 4 5 6 6 7)
                     (stream-values 3 3 4  4 5 5 6 6 7))))