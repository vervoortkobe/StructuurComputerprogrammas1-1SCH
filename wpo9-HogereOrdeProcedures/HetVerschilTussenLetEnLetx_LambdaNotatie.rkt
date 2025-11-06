((lambda (x y z)
   (+ x y z))
 2
 (+ x 8)
 (/ y x))

((lambda (x)
   ((lambda (y)
      ((lambda (z)
         (+ x y z))
       (/ x y z)))
    (+ x 8)))
 2)
