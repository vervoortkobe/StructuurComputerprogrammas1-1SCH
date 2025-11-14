(define (map! f lst)
  (cond ((not (null? lst))
         (set-car! lst (f (car lst)))
         (map! f (cdr lst)))))

(define l (list 1 2 3 4))
(map! (lambda (x) (* x x)) l)
l