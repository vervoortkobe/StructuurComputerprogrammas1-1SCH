; f
(define f 5)

; (f)
(define f (lambda() 5))
(define (f) 5)

; (f 3)
(define f (lambda (x) 5))

; ((f))
(define f (lambda () (lambda () 5)))

; (((f)) 3)
(define f (lambda () (lambda () (lambda (drie) 5))))
