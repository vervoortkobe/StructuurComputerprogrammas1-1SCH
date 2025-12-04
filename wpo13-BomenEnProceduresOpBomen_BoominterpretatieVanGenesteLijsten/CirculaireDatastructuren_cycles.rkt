#lang r5rs

(define (cycles? r)
  (define (advance x)
    (if (pair? x)
        (cdr x)
        '()))

  (let loop ((slow r)
             (fast (advance r)))
    (cond
      ((or (not (pair? fast))
           (not (pair? (advance fast))))
       #f)
      ((eq? slow fast)
       #t)
      (else
       (loop (advance slow)
             (advance (advance fast)))))))

(cycles? '())
(cycles? '(1 2 3))
(define car-loop
    (let ((first (cons 'a '())))
      (set-car! first first)
      first))
(cycles? car-loop)
(define ring
    (let* ((last (cons '3 '()))
           (list (cons 1 (cons 2 last))))
      (set-cdr! last list)
      list))
(cycles? ring)
