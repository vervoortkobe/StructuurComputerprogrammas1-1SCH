(define (make-parking capacity1 capacity2)
  (let ((counter1 (make-counter 0))
        (counter2 (make-counter 0))
        (capacity (+ capacity1 capacity2)))
    
    (define (full?)
      (and (= (counter1 'read) capacity1)
           (= (counter2 'read) capacity2)))
    
    (define (empty?)
      (and (= (counter1 'read) 0)
           (= (counter2 'read) 0)))
    
    (define (current-level)
      (if (>= (counter1 'read) capacity1)
          2
          1))
    
    (define (car-enters!)
      (if (full?)
          #f
          (if (= (current-level) 1)
              (counter1 'increase!)
              (counter2 'increase!))))
    
    (define (car-leaves!)
      (if (empty?)
          #f
          (cond ((and (= (current-level) 2) 
                      (= (counter2 'read) 0))
                 (counter1 'decrease!))
                ((= (current-level) 2)
                 (counter2 'decrease!))
                (else (counter1 'decrease!)))))
    
    (lambda (msg)
      (cond ((eq? msg 'full?) (full?))
            ((eq? msg 'empty?) (empty?))
            ((eq? msg 'level) (current-level))
            ((eq? msg 'car-enters!) (car-enters!))
            ((eq? msg 'car-leaves!) (car-leaves!))
            (else (display "wrong message"))))))