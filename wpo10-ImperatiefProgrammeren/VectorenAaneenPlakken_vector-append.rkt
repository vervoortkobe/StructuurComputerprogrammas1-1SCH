(define (vector-append v1 v2)
  (let ((result-vector (make-vector (+ (vector-length v1) (vector-length v2)))))
    
    (do ((i 0 (+ i 1)))
        ((= i (vector-length v1)))
      (vector-set! result-vector i (vector-ref v1 i)))
    
    (do ((i 0 (+ i 1)))
        ((= i (vector-length v2)))
      (vector-set! result-vector (+ (vector-length v1) i) (vector-ref v2 i)))
    
    result-vector))

(vector-append (vector 1 2 3) (vector 4 5 6 7))