(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 3 n)))

(define (f-iter f-minus-1 f-minus-2 f-minus-3 i n)
  (define (current-result)
    (+ f-minus-1 (* 2 f-minus-2) (* 3 f-minus-3)))
  
  (if (= i n)
      (current-result)
      (f-iter (current-result) f-minus-1 f-minus-2 (+ i 1) n)))

(print (f 0))
(print (f 1))
(print (f 2))
(print (f 3))
(print (f 4))
(print (f 5))
(print (f 15))
