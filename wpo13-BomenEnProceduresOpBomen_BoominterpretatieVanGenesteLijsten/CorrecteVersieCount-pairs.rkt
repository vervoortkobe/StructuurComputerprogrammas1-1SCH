#lang r5rs

(define (count-pairs x)
  (let ((seen '()))
    (define (do-count p)
      (cond ((not (pair? p)) 0)
            ((memq p seen) 0)
            (else
             (set! seen (cons p seen))
             (+ 1
                (do-count (car p))
                (do-count (cdr p))))))
    (do-count x)))

(define ret3 (cons 'a (cons 'b (cons 'c '()))))
(count-pairs ret3)
(define ret4
    (let ((last (cons 'c '())))
      (cons last (cons 'b last))))
(count-pairs ret4)
(define ret7
    (let* ((last (cons 'c '()))
           (middle (cons last last)))
      (cons middle middle)))
(count-pairs ret7)
(define retno
    (let* ((last (cons 'c '()))
           (lst (cons 'a (cons 'b last))))
      (set-cdr! last lst)
      lst))
(count-pairs retno)
