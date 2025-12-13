(load "streams.rkt")

(define (print-m matrix)
  (display "[")
  (stream-print (head matrix)) (newline)
  (stream-for-each (lambda (x) (display " ")
                     (stream-print x) (newline))
                   (tail matrix))
  (display "]\n"))

; iter
(define (split stream n)
  (define (splitter stream res i)
    (cond ((or (empty-stream? stream) (= i n))
           (cons (apply stream-values (reverse res))
                 stream))
          (else (splitter (tail stream)
                          (cons (head stream) res)
                          (+ i 1)))))
  (if (empty-stream? stream)
     the-empty-stream
     (let ((tmp (splitter stream '() 0)))
       (cons-stream (car tmp)
                    (split (cdr tmp) n)))))

;rec
(define (split stream n)
  (define (splitter stream i)
    (cond ((or (empty-stream? stream) (= i n))
           (cons the-empty-stream stream))
          (else (let ((tmp (splitter (tail stream) (+ i 1))))
                  (cons (cons-stream (head stream) (car tmp))
                        (cdr tmp))))))

  (if (empty-stream? stream)
      the-empty-stream
      (let ((tmp (splitter stream 0)))
        (cons-stream (car tmp)
                     (split(cdr tmp) n)))))

(print-m (split (stream-values 1 2 3 4 5 6 7 8 9) 2))