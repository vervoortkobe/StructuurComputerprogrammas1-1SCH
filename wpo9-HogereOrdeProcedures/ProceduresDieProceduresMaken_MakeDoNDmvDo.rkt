(define (make-do-n f n)
  (lambda ()
    (do ((i 0 (+ i 1)))
    (( >= i n))
    (f))))

(define (print-hallo)
  (display "hallo"))

(make-do-n print-hallo 2)
