(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))

  (iter a 1))

(define (pi-with-product product-fn n)
  (define (f n)
    (/ (* 4. n n) (- (* 4. n n) 1)))
  
  (* 2 (product-fn f 1 inc n)))

(define (pi-recursive n)
  (pi-with-product product-recursive n))

(define (pi-iter n)
  (pi-with-product product-iter n))

(define (inc a)
  (+ a 1))

(print (pi-recursive 1000))
(print (pi-iter 1000))
