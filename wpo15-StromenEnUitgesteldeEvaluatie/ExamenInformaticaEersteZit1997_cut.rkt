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

(print-m (cut (stream-values 1 1 1 2 2 3 5 5 6 6 6)))