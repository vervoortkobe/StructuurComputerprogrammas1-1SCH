(define (vector-map f vec)
  (let* ((len (vector-length vec))
         (result-vec (make-vector len)))
    (do ((i 0 (+ i 1)))
        ((= i len) result-vec)
      (vector-set! result-vec i (f (vector-ref vec i))))))

(define v (vector 1 2 3 4))
(vector-map (lambda (x) (* x x)) v)