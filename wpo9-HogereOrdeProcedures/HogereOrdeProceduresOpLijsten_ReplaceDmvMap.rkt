(define (replace-dmv-map e1 e2 l)
  (map (lambda (x)
         (if (eq? x e1)
             e2
             x))
       l))
